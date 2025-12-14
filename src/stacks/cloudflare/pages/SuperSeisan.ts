import { PagesProject } from '@cdktf/provider-cloudflare/lib/pages-project'
import { Construct } from 'constructs'

export type SuperSeisanConfig = Readonly<{
  accountId: string
}>

export class SuperSeisan extends Construct {
  constructor(scope: Construct, id: string, config: SuperSeisanConfig) {
    super(scope, id)

    new PagesProject(this, 'super-seisan', {
      accountId: config.accountId,
      name: 'super-seisan',
      productionBranch: 'main',
      buildConfig: {
        buildCommand: 'pnpm run build',
        destinationDir: 'dist',
        rootDir: './legacy',
      },
      deploymentConfigs: {
        production: {
          compatibilityDate: '2025-11-17',
          environmentVariables: {},
          failOpen: true,
          usageModel: 'standard',
        },
      },
      source: {
        type: 'github',
        config: {
          owner: 'rokoucha',
          prCommentsEnabled: true,
          previewBranchIncludes: ['*'],
          previewDeploymentSetting: 'all',
          productionBranch: 'main',
          repoName: 'super-seisan',
        },
      },
    })
  }
}
