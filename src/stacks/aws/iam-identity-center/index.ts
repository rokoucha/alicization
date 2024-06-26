import { DataAwsSsoadminInstances } from '@cdktf/provider-aws/lib/data-aws-ssoadmin-instances'
import { IdentitystoreGroup } from '@cdktf/provider-aws/lib/identitystore-group'
import { OrganizationsAccount } from '@cdktf/provider-aws/lib/organizations-account'
import { SsoadminAccountAssignment } from '@cdktf/provider-aws/lib/ssoadmin-account-assignment'
import { SsoadminPermissionSet } from '@cdktf/provider-aws/lib/ssoadmin-permission-set'
import { Fn } from 'cdktf'
import { Construct } from 'constructs'
import { Accounts } from '../organizations'
import { IdentityStore } from './identity-store'
import { PermissionSet } from './permission-set'

export type IAMIdentityCenterProps = Readonly<{
  accounts: Accounts
}>

export class IAMIdentityCenter extends Construct {
  constructor(scope: Construct, id: string, props: IAMIdentityCenterProps) {
    super(scope, id)

    const instances = new DataAwsSsoadminInstances(this, 'sso-instance')

    const instanceArn = Fn.element(instances.arns, 0)

    const permissionSet = new PermissionSet(this, 'permission-set', {
      instanceArn,
    })

    const identityStore = new IdentityStore(this, 'identity-store', {
      identityStoreId: Fn.element(instances.identityStoreIds, 0),
    })

    const accountAsignments: [
      OrganizationsAccount,
      [IdentitystoreGroup, SsoadminPermissionSet[]][],
    ][] = [
      [
        props.accounts.rokoucha,
        [
          [
            identityStore.groups.admin,
            [
              permissionSet.permissions.administratorAccess,
              permissionSet.permissions.powerUserAccess,
              permissionSet.permissions.viewOnlyAccess,
            ],
          ],
        ],
      ],
      [
        props.accounts.isucon13,
        [
          [
            identityStore.groups.admin,
            [
              permissionSet.permissions.administratorAccess,
              permissionSet.permissions.powerUserAccess,
              permissionSet.permissions.viewOnlyAccess,
            ],
          ],
          [
            identityStore.groups.isucon13,
            [
              permissionSet.permissions.powerUserAccess,
              permissionSet.permissions.viewOnlyAccess,
            ],
          ],
        ],
      ],
    ]

    for (const [account, assignments] of accountAsignments) {
      for (const [group, permissions] of assignments) {
        for (const permission of permissions) {
          new SsoadminAccountAssignment(
            this,
            `${account}-${group}-${permission}`,
            {
              instanceArn,
              permissionSetArn: permission.arn,
              principalId: group.groupId,
              principalType: 'GROUP',
              targetId: account.id,
              targetType: 'AWS_ACCOUNT',
            },
          )
        }
      }
    }
  }
}
