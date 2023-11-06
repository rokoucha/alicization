import { App } from 'cdktf'
import { AWSStack } from './stacks/aws/index.js'
import { CloudflareStack } from './stacks/cloudflare/index.js'

const app = new App()

new AWSStack(app, 'aws')
new CloudflareStack(app, 'cloudflare')

app.synth()
