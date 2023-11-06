import { IdentitystoreGroup } from '@cdktf/provider-aws/lib/identitystore-group/index.js'
import { Construct } from 'constructs'

export type Groups = {
  admin: IdentitystoreGroup
  isucon13: IdentitystoreGroup
}

export type IdentityStoreProps = Readonly<{
  identityStoreId: string
}>

export class IdentityStore extends Construct {
  readonly groups: Groups

  constructor(scope: Construct, id: string, props: IdentityStoreProps) {
    super(scope, id)

    const admin = new IdentitystoreGroup(this, 'admin', {
      displayName: 'admin',
      identityStoreId: props.identityStoreId,
    })

    const isucon13 = new IdentitystoreGroup(this, 'isucon13', {
      displayName: 'isucon13',
      identityStoreId: props.identityStoreId,
    })

    this.groups = { admin, isucon13 }
  }
}
