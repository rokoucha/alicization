import { Construct } from 'constructs'
import { Role } from '../../../../.gen/providers/mackerel/role'
import { Service } from '../../../../.gen/providers/mackerel/service'

export class Machines extends Construct {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    const service = new Service(this, 'machines', {
      name: 'machines',
    })

    new Role(this, 'physical', {
      name: 'physical',
      service: service.name,
    })

    new Role(this, 'virtual', {
      name: 'virtual',
      service: service.name,
    })
  }
}
