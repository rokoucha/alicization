import { Construct } from 'constructs'
import { Monitor } from '../../../../.gen/providers/mackerel/monitor'
import { Role } from '../../../../.gen/providers/mackerel/role'
import { Service } from '../../../../.gen/providers/mackerel/service'

export class GgrelDTV extends Construct {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    const service = new Service(this, 'ggrel-dtv', {
      name: 'Ggrel-DTV',
      memo: 'Ggrel DTV Services',
    })

    new Role(this, 'host', {
      name: 'host',
      service: service.name,
    })

    new Monitor(this, 'epgstation', {
      name: 'EPGStation',
      external: {
        method: 'GET',
        url: 'https://dtv.ggrel.net',
        service: service.name,
        responseTimeWarning: 5000,
        responseTimeCritical: 10000,
        responseTimeDuration: 3,
        headers: {
          'Cache-Control': 'no-cache',
        },
        maxCheckAttempts: 3,
        followRedirect: true,
      },
    })

    new Monitor(this, 'mirakurun', {
      name: 'Mirakurun',
      external: {
        method: 'GET',
        url: 'https://dtv.ggrel.net/mirakurun',
        service: service.name,
        responseTimeWarning: 5000,
        responseTimeCritical: 10000,
        responseTimeDuration: 3,
        headers: {
          'Cache-Control': 'no-cache',
        },
        maxCheckAttempts: 3,
        followRedirect: true,
      },
    })
  }
}
