import { Testing } from 'cdktf'
import { describe, expect, it } from 'vitest'
import { MackerelProvider } from '../../.gen/providers/mackerel/provider'
import { MackerelStack } from '../../src/stacks/mackerel'
import { forceIgnoreProviderVersion } from '../util'

describe('Mackerel', () => {
  it('snapshot', () => {
    const app = Testing.app()
    const stack = new MackerelStack(app, 'mackerel')
    forceIgnoreProviderVersion(stack, MackerelProvider)
    expect(Testing.synth(stack)).toMatchSnapshot()
  })
})
