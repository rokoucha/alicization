import { Construct } from 'constructs'
import { Role } from '../../../../.gen/providers/mackerel/role'
import { Service } from '../../../../.gen/providers/mackerel/service'

export class MateriaCluster extends Construct {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    const service = new Service(this, 'materia-cluster', {
      name: 'materia-cluster',
    })

    new Role(this, 'controller', {
      name: 'controller',
      service: service.name,
    })

    new Role(this, 'worker', {
      name: 'worker',
      service: service.name,
    })
  }
}
