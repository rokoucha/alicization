import { Construct } from 'constructs'
import { Role } from '../../../../.gen/providers/mackerel/role'
import { Service } from '../../../../.gen/providers/mackerel/service'

export class Lithium extends Construct {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    const service = new Service(this, 'lithium', {
      name: 'lithium',
    })

    new Role(this, 'guest', {
      name: 'guest',
      service: service.name,
    })

    new Role(this, 'host', {
      name: 'host',
      service: service.name,
    })
  }
}
