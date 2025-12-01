import { Testing } from 'cdktf'
import { describe, expect, it } from 'vitest'
import { AWSStack } from '../../src/stacks/aws'

describe('AWS', () => {
  it('snapshot', () => {
    const app = Testing.app()
    const stack = new AWSStack(app, 'aws')
    expect(Testing.synth(stack)).toMatchSnapshot()
  })
})
