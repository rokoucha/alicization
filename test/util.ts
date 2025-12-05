import { TerraformStack } from 'cdktf'

export function forceIgnoreProviderVersion(stack: TerraformStack, target: any) {
  stack.node.children.forEach((child: any) => {
    if (!(child instanceof target)) return
    ;(child.terraformGeneratorMetadata!! as any) = {
      providerName: child.terraformGeneratorMetadata!!.providerName,
    }
  })
}
