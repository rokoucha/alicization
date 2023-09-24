import { App } from 'cdktf'
import { CloudflareStack } from './stacks/cloudflare/index.js'

const app = new App()

new CloudflareStack(app, 'cloudflare')

app.synth()
