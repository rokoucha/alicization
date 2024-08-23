import { PagesDomain } from '@cdktf/provider-cloudflare/lib/pages-domain'
import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project'
import { TerraformVariable } from 'cdktf'
import { Construct } from 'constructs'

export type ScienestConfig = Readonly<{
  accountId: string
}>

export class Scienest extends Construct {
  constructor(scope: Construct, id: string, config: ScienestConfig) {
    super(scope, id)

    const authGitHubId = new TerraformVariable(this, 'AUTH_GITHUB_ID', {
      description: 'Scienest AUTH_GITHUB_ID',
      type: 'string',
    })

    const authGitHubSecret = new TerraformVariable(this, 'AUTH_GITHUB_SECRET', {
      description: 'Scienest AUTH_GITHUB_SECRET',
      sensitive: true,
      type: 'string',
    })

    const authSecret = new TerraformVariable(this, 'AUTH_SECRET', {
      description: 'Scienest AUTH_SECRET',
      sensitive: true,
      type: 'string',
    })

    const pages = new PagesProject(this, 'scienest', {
      accountId: config.accountId,
      name: 'scienest',
      productionBranch: 'master',
      buildConfig: {
        buildCaching: true,
        buildCommand: 'pnpm run build:next',
        destinationDir: '.vercel/output/static',
      },
      deploymentConfigs: {
        production: {
          compatibilityDate: '2024-06-03',
          compatibilityFlags: ['nodejs_compat'],
          d1Databases: {
            DB: '6932807b-60cc-425a-b309-eebcea6f13c4',
          },
          environmentVariables: {
            APP_ENV: 'production',
            AUTH_GITHUB_ID: authGitHubId.value,
            AUTH_TRUST_HOST: 'rokoucha.net',
            BASE_URL: 'https://rokoucha.net',
            GITHUB_USER_ID: '6058487',
            NODE_VERSION: '20',
            SITE_DESCRIPTION: "The world isn't my oyster.",
            SITE_LANG: 'ja',
            SITE_NAME: 'Rokoucha',
            SITE_TWITTER_CARD_SITE: '@rokoucha',
          },
          failOpen: true,
          secrets: {
            AUTH_GITHUB_SECRET: authGitHubSecret.value,
            AUTH_SECRET: authSecret.value,
          },
          usageModel: 'standard',
        },
      },
      source: {
        type: 'github',
        config: {
          owner: 'rokoucha',
          previewBranchIncludes: ['*'],
          previewDeploymentSetting: 'none',
          productionBranch: 'master',
          repoName: 'scienest',
        },
      },
    })

    new PagesDomain(this, 'rokoucha.net', {
      accountId: config.accountId,
      domain: 'rokoucha.net',
      projectName: pages.name,
    })
  }
}
