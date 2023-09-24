import { App } from 'cdktf'
import { NoaPpUaStack } from './stacks/zones/NoaPpUaStack.js'

const app = new App()

new NoaPpUaStack(app, 'noa.pp.ua')

app.synth()
