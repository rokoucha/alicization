import { AwsProvider } from '@cdktf/provider-aws/lib/provider'
import { Testing } from 'cdktf'
import { describe, expect, it } from 'vitest'
import { AWSStack } from '../../src/stacks/aws'
import { forceIgnoreProviderVersion } from '../util'

describe('AWS', () => {
  it('snapshot', () => {
    const app = Testing.app()
    const stack = new AWSStack(app, 'aws')
    forceIgnoreProviderVersion(stack, AwsProvider)
    expect(Testing.synth(stack)).toMatchSnapshot()
  })
})
