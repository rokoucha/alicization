import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project/index.js'
import { TerraformVariable } from 'cdktf'
import { Construct } from 'constructs'

export type CloudflarePagesFunctionsNextJsConfig = Readonly<{
  accountId: string
}>

export class CloudflarePagesFunctionsNextJs extends Construct {
  constructor(
    scope: Construct,
    id: string,
    config: CloudflarePagesFunctionsNextJsConfig,
  ) {
    super(scope, id)

    const authGitHubId = new TerraformVariable(this, 'AUTH_GITHUB_ID', {
      description: 'cloudflare-pages-function-next-js AUTH_GITHUB_ID',
      type: 'string',
    })

    const authGitHubSecret = new TerraformVariable(this, 'AUTH_GITHUB_SECRET', {
      description: 'cloudflare-pages-function-next-js AUTH_GITHUB_SECRET',
      sensitive: true,
      type: 'string',
    })

    const authSecret = new TerraformVariable(this, 'AUTH_SECRET', {
      description: 'cloudflare-pages-function-next-js AUTH_SECRET',
      sensitive: true,
      type: 'string',
    })

    new PagesProject(this, 'cloudflare-pages-function-next-js', {
      accountId: config.accountId,
      name: 'cloudflare-pages-function-next-js',
      productionBranch: 'master',
      buildConfig: {
        buildCommand: 'pnpm run build:next',
        destinationDir: '.vercel/output/static',
      },
      deploymentConfigs: {
        production: {
          compatibilityDate: '2023-07-22',
          compatibilityFlags: ['nodejs_compat'],
          environmentVariables: {
            AUTH_GITHUB_ID: authGitHubId.value,
            AUTH_TRUST_HOST: 'cloudflare-pages-function-next-js.pages.dev',
            NODE_VERSION: '20',
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
          repoName: 'cloudflare-pages-function-next-js',
        },
      },
    })
  }
}
