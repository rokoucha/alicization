import { Testing } from 'cdktf'
import { describe, expect, it } from 'vitest'
import { TerraformCloudStack } from '../../src/stacks/terraform-cloud'

describe('TerraformCloud', () => {
  it('snapshot', () => {
    const app = Testing.app()
    const stack = new TerraformCloudStack(app, 'terraform-cloud')
    expect(Testing.synth(stack)).toMatchSnapshot()
  })
})
