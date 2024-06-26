import { Construct } from 'constructs'
import { Monitor } from '../../../../.gen/providers/mackerel/monitor'
import { Service } from '../../../../.gen/providers/mackerel/service'

export class Ggrel extends Construct {
  constructor(scope: Construct, id: string) {
    super(scope, id)

    const service = new Service(this, 'ggrel', {
      name: 'Ggrel',
    })

    new Monitor(this, 'ggrel-net', {
      name: 'ggrel.net',
      external: {
        method: 'GET',
        url: 'https://ggrel.net',
        service: service.name,
        responseTimeWarning: 5000,
        responseTimeCritical: 10000,
        responseTimeDuration: 3,
        certificationExpirationWarning: 7,
        certificationExpirationCritical: 3,
        headers: {
          'Cache-Control': 'no-cache',
        },
        maxCheckAttempts: 3,
      },
    })

    new Monitor(this, 'heinrike-prinzessin-zu-sayn-wittgenste-in', {
      name: 'heinrike.prinzessin.zu.sayn-wittgenste.in',
      external: {
        method: 'GET',
        url: 'https://heinrike.prinzessin.zu.sayn-wittgenste.in',
        service: service.name,
        responseTimeWarning: 5000,
        responseTimeCritical: 10000,
        responseTimeDuration: 3,
        certificationExpirationWarning: 7,
        certificationExpirationCritical: 3,
        headers: {
          'Cache-Control': 'no-cache',
        },
        maxCheckAttempts: 3,
      },
    })

    new Monitor(this, 'mastodon-rokoucha', {
      name: 'Mastodon/Rokoucha',
      external: {
        method: 'GET',
        url: 'https://ma.rokoucha.net',
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

    new Monitor(this, 'rokoucha-net', {
      name: 'rokoucha.net',
      external: {
        method: 'GET',
        url: 'https://rokoucha.net',
        service: service.name,
        responseTimeWarning: 7500,
        responseTimeCritical: 10000,
        responseTimeDuration: 3,
        certificationExpirationWarning: 7,
        certificationExpirationCritical: 3,
        headers: {
          'Cache-Control': 'no-cache',
        },
        maxCheckAttempts: 3,
      },
    })
  }
}
