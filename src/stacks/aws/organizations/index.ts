import { OrganizationsAccount } from '@cdktf/provider-aws/lib/organizations-account'
import { Construct } from 'constructs'

export type Accounts = {
  rokoucha: OrganizationsAccount
}

export class Organizations extends Construct {
  readonly accounts: Accounts

  constructor(scope: Construct, id: string) {
    super(scope, id)

    const rokoucha = new OrganizationsAccount(this, 'rokoucha', {
      name: 'rokoucha',
      email: 'esazeumo@8c7042.org',
    })

    this.accounts = {
      rokoucha,
    }
  }
}
