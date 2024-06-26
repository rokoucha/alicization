import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project'
import { Construct } from 'constructs'

export type _8c7042OrgConfig = Readonly<{
  accountId: string
}>

export class _8c7042Org extends Construct {
  constructor(scope: Construct, id: string, config: _8c7042OrgConfig) {
    super(scope, id)

    new PagesProject(this, '_8c7042-org', {
      accountId: config.accountId,
      name: '8c7042-org',
      productionBranch: 'master',
      deploymentConfigs: {
        production: {
          compatibilityDate: '2023-05-16',
          failOpen: true,
          usageModel: 'standard',
        },
      },
      source: {
        type: 'github',
        config: {
          owner: 'rokoucha',
          previewBranchIncludes: ['*'],
          productionBranch: 'master',
          repoName: '8c7042.org',
        },
      },
    })
  }
}
