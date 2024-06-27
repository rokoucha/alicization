import { App } from 'cdktf'
import { AWSStack } from './stacks/aws'
import { CloudflareStack } from './stacks/cloudflare'
import { MackerelStack } from './stacks/mackerel'
import { TerraformCloudStack } from './stacks/terraform-cloud'

const app = new App()

new AWSStack(app, 'aws')
new CloudflareStack(app, 'cloudflare')
new MackerelStack(app, 'mackerel')
new TerraformCloudStack(app, 'terraform-cloud')

app.synth()
