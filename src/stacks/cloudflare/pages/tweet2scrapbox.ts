import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project/index.js'
import { TerraformVariable } from 'cdktf'
import { Construct } from 'constructs'

export type Tweet2ScrapboxConfig = Readonly<{
  accountId: string
}>

export class Tweet2Scrapbox extends Construct {
  constructor(scope: Construct, id: string, config: Tweet2ScrapboxConfig) {
    super(scope, id)

    const twtterBearerToken = new TerraformVariable(
      this,
      'TWITTER_BEARER_TOKEN',
      {
        description: 'tweet2scrapbox TWITTER_BEARER_TOKEN',
        type: 'string',
      },
    )

    new PagesProject(this, 'tweet2scrapbox', {
      accountId: config.accountId,
      name: 'tweet2scrapbox',
      productionBranch: 'master',
      buildConfig: {
        buildCommand: 'pnpm run build',
        destinationDir: 'public',
      },
      deploymentConfigs: {
        production: {
          compatibilityDate: '2023-04-20',
          environmentVariables: {
            NODE_VERSION: '20',
          },
          failOpen: true,
          secrets: {
            TWITTER_BEARER_TOKEN: twtterBearerToken.value,
          },
        },
      },
      source: {
        type: 'github',
        config: {
          owner: 'rokoucha',
          previewBranchIncludes: ['*'],
          previewDeploymentSetting: 'all',
          productionBranch: 'master',
          repoName: 'tweet2scrapbox',
        },
      },
    })
  }
}
