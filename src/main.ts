import { App } from 'cdktf'
import { AWSStack } from './stacks/aws'
import { CloudflareStack } from './stacks/cloudflare'
import { MackerelStack } from './stacks/mackerel'

const app = new App()

new AWSStack(app, 'aws')
new CloudflareStack(app, 'cloudflare')
new MackerelStack(app, 'mackerel')

app.synth()
