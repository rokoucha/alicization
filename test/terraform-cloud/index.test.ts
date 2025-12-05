import { TfeProvider } from '@cdktf/provider-tfe/lib/provider'
import { Testing } from 'cdktf'
import { describe, expect, it } from 'vitest'
import { TerraformCloudStack } from '../../src/stacks/terraform-cloud'
import { forceIgnoreProviderVersion } from '../util'

describe('TerraformCloud', () => {
  it('snapshot', () => {
    const app = Testing.app()
    const stack = new TerraformCloudStack(app, 'terraform-cloud')
    forceIgnoreProviderVersion(stack, TfeProvider)
    expect(Testing.synth(stack)).toMatchSnapshot()
  })
})
