import { App } from 'cdktf'
import { AWSStack } from './stacks/aws'
import { CloudflareStack } from './stacks/cloudflare'

const app = new App()

new AWSStack(app, 'aws')
new CloudflareStack(app, 'cloudflare')

app.synth()
