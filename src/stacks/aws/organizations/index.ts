import { OrganizationsAccount } from '@cdktf/provider-aws/lib/organizations-account/index.js'
import { Construct } from 'constructs'

export type Accounts = {
  rokoucha: OrganizationsAccount
  isucon13: OrganizationsAccount
}

export class Organizations extends Construct {
  readonly accounts: Accounts

  constructor(scope: Construct, id: string) {
    super(scope, id)

    const rokoucha = new OrganizationsAccount(this, 'rokoucha', {
      name: 'rokoucha',
      email: 'esazeumo@8c7042.org',
    })

    const isucon13 = new OrganizationsAccount(this, 'isucon13', {
      name: 'isucon13',
      email: 'yzwrnns1@8c7042.org',
    })

    this.accounts = {
      rokoucha,
      isucon13,
    }
  }
}
