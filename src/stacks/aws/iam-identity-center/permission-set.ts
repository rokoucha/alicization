import { SsoadminManagedPolicyAttachment } from '@cdktf/provider-aws/lib/ssoadmin-managed-policy-attachment'
import { SsoadminPermissionSet } from '@cdktf/provider-aws/lib/ssoadmin-permission-set'
import { Construct } from 'constructs'

export type PermissionSetProps = Readonly<{
  instanceArn: string
}>

export class PermissionSet extends Construct {
  readonly permissions: {
    administratorAccess: SsoadminPermissionSet
    powerUserAccess: SsoadminPermissionSet
    viewOnlyAccess: SsoadminPermissionSet
  }

  constructor(scope: Construct, id: string, props: PermissionSetProps) {
    super(scope, id)

    const administratorAccess = new SsoadminPermissionSet(
      scope,
      'administrator-access',
      {
        instanceArn: props.instanceArn,
        name: 'AdministratorAccess',
        sessionDuration: 'PT8H',
      },
    )

    new SsoadminManagedPolicyAttachment(
      this,
      'administrator-access-attachment',
      {
        instanceArn: props.instanceArn,
        managedPolicyArn: 'arn:aws:iam::aws:policy/AdministratorAccess',
        permissionSetArn: administratorAccess.arn,
      },
    )

    const powerUserAccess = new SsoadminPermissionSet(
      scope,
      'power-user-access',
      {
        instanceArn: props.instanceArn,
        name: 'PowerUserAccess',
        sessionDuration: 'PT8H',
      },
    )

    new SsoadminManagedPolicyAttachment(this, 'power-user-access-attachment', {
      instanceArn: props.instanceArn,
      managedPolicyArn: 'arn:aws:iam::aws:policy/PowerUserAccess',
      permissionSetArn: powerUserAccess.arn,
    })

    const viewOnlyAccess = new SsoadminPermissionSet(
      scope,
      'view-only-access',
      {
        instanceArn: props.instanceArn,
        name: 'ViewOnlyAccess',
        sessionDuration: 'PT8H',
      },
    )

    new SsoadminManagedPolicyAttachment(this, 'view-only-access-attachment', {
      instanceArn: props.instanceArn,
      managedPolicyArn: 'arn:aws:iam::aws:policy/job-function/ViewOnlyAccess',
      permissionSetArn: viewOnlyAccess.arn,
    })

    this.permissions = { administratorAccess, powerUserAccess, viewOnlyAccess }
  }
}
