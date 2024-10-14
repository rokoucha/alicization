import { Construct } from 'constructs'
import { Monitor } from '../../../../.gen/providers/mackerel/monitor'
import { Role } from '../../../../.gen/providers/mackerel/role'
import { Service } from '../../../../.gen/providers/mackerel/service'

export class Machines extends Construct {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    const service = new Service(this, 'machines', {
      name: 'machines',
    })

    const physical = new Role(this, 'physical', {
      name: 'physical',
      service: service.name,
    })

    const virtual = new Role(this, 'virtual', {
      name: 'virtual',
      service: service.name,
    })

    new Monitor(this, 'anomaly-detection', {
      name: '異状検知',
      anomalyDetection: {
        scopes: [physical.id, virtual.id],
        warningSensitivity: 'sensitive',
        criticalSensitivity: 'normal',
        maxCheckAttempts: 3,
      },
    }).importFrom('5gLvgj1uaAG')
  }
}
