import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project/index.js'
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

    const db = new TerraformVariable(this, 'DB', {
      description: 'Cloudflare D1 database for Scienest',
      type: 'string',
    })

    new PagesProject(this, 'scienest', {
      accountId: config.accountId,
      name: 'scienest',
      productionBranch: 'master',
      buildConfig: {
        buildCommand: 'pnpm run build:next',
        destinationDir: '.vercel/output/static',
      },
      deploymentConfigs: {
        production: {
          compatibilityDate: '2023-03-14',
          compatibilityFlags: ['nodejs_compat'],
          d1Databases: {
            DB: db.value,
          },
          environmentVariables: {
            APP_ENV: 'production',
            AUTH_GITHUB_ID: authGitHubId.value,
            AUTH_TRUST_HOST: 'scienest.pages.dev',
            BASE_URL: 'https://scienest.pages.dev',
            GITHUB_USER_ID: '6058487',
            NODE_VERSION: '20',
            SITE_DESCRIPTION: 'Scientia est potentia',
            SITE_LANG: 'ja',
            SITE_NAME: 'Scienest',
          },
          failOpen: true,
          secrets: {
            AUTH_GITHUB_SECRET: authGitHubSecret.value,
            AUTH_SECRET: authSecret.value,
          },
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
  }
}
