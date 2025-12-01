import { Testing } from 'cdktf'
import { describe, expect, it } from 'vitest'
import { MackerelStack } from '../../src/stacks/mackerel'

describe('Mackerel', () => {
  it('snapshot', () => {
    const app = Testing.app()
    const stack = new MackerelStack(app, 'mackerel')
    expect(Testing.synth(stack)).toMatchSnapshot()
  })
})
