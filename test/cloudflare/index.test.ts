import { CloudflareProvider } from '@cdktf/provider-cloudflare/lib/provider'
import { Testing } from 'cdktf'
import { describe, expect, it } from 'vitest'
import { CloudflareStack } from '../../src/stacks/cloudflare'
import { forceIgnoreProviderVersion } from '../util'

describe('Cloudflare', () => {
  it('snapshot', () => {
    const app = Testing.app()
    const stack = new CloudflareStack(app, 'cloudflare')
    forceIgnoreProviderVersion(stack, CloudflareProvider)
    expect(Testing.synth(stack)).toMatchSnapshot()
  })
})
