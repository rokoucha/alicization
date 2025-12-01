import { Testing } from 'cdktf'
import { describe, expect, it } from 'vitest'
import { CloudflareStack } from '../../src/stacks/cloudflare'

describe('Cloudflare', () => {
  it('snapshot', () => {
    const app = Testing.app()
    const stack = new CloudflareStack(app, 'cloudflare')
    expect(Testing.synth(stack)).toMatchSnapshot()
  })
})
