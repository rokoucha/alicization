import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project/index.js'
import { TerraformVariable } from 'cdktf'
import { Construct } from 'constructs'

export type AuthJsCloudflarePagesFunctionsProps = Readonly<{
  accountId: string
}>

export class AuthJsCloudflarePagesFunctions extends Construct {
  constructor(
    scope: Construct,
    id: string,
    props: AuthJsCloudflarePagesFunctionsProps,
  ) {
    super(scope, id)

    const authGitHubId = new TerraformVariable(this, 'AUTH_GITHUB_ID', {
      description: 'authjs-cloudflare-pages-functions AUTH_GITHUB_ID',
      type: 'string',
    })

    const authGitHubSecret = new TerraformVariable(this, 'AUTH_GITHUB_SECRET', {
      description: 'authjs-cloudflare-pages-functions AUTH_GITHUB_SECRET',
      sensitive: true,
      type: 'string',
    })

    const authSecret = new TerraformVariable(this, 'AUTH_SECRET', {
      description: 'authjs-cloudflare-pages-functions AUTH_SECRET',
      sensitive: true,
      type: 'string',
    })

    new PagesProject(this, 'authjs-cloudflare-pages-functions', {
      accountId: props.accountId,
      name: 'authjs-cloudflare-pages-functions',
      productionBranch: 'master',
      buildConfig: {
        buildCommand: 'pnpm run build',
        destinationDir: './public',
      },
      deploymentConfigs: {
        production: {
          compatibilityDate: '2023-12-03',
          compatibilityFlags: [],
          environmentVariables: {
            AUTH_GITHUB_ID: authGitHubId.value,
            NODE_VERSION: '20',
          },
          failOpen: false,
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
          repoName: 'authjs-cloudflare-pages-functions',
        },
      },
    })
  }
}
