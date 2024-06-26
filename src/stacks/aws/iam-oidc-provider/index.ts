import { DataAwsIamPolicyDocument } from '@cdktf/provider-aws/lib/data-aws-iam-policy-document'
import { IamOpenidConnectProvider } from '@cdktf/provider-aws/lib/iam-openid-connect-provider'
import { IamRole } from '@cdktf/provider-aws/lib/iam-role'
import { DataTlsCertificate } from '@cdktf/provider-tls/lib/data-tls-certificate'
import { TlsProvider } from '@cdktf/provider-tls/lib/provider'
import { Construct } from 'constructs'

export type TFCIAMOidcProviderProps = Readonly<{
  hostname: string
  organization: string
  project: string
  workspace: string
}>

export class TFCIAMOidcProvider extends Construct {
  constructor(scope: Construct, id: string, props: TFCIAMOidcProviderProps) {
    super(scope, id)

    new TlsProvider(this, 'tls')

    const certificate = new DataTlsCertificate(this, 'tfc-certificate', {
      url: `https://${props.hostname}`,
    })

    const provider = new IamOpenidConnectProvider(this, 'tfc-oidc-provider', {
      clientIdList: ['aws.workload.identity'],
      thumbprintList: [certificate.certificates.get(0).sha1Fingerprint],
      url: certificate.url,
    })

    const rolePolicyDoc = new DataAwsIamPolicyDocument(
      this,
      'tfc-iam-oidc-provider-role-policy-document',
      {
        statement: [
          {
            effect: 'Allow',
            principals: [
              {
                type: 'Federated',
                identifiers: [provider.arn],
              },
            ],
            actions: ['sts:AssumeRoleWithWebIdentity'],
            condition: [
              {
                test: 'StringEquals',
                variable: `${props.hostname}:aud`,
                values: provider.clientIdList,
              },
              {
                test: 'StringLike',
                variable: `${props.hostname}:sub`,
                values: [
                  `organization:${props.organization}:project:${props.project}:workspace:${props.workspace}:run_phase:*`,
                ],
              },
            ],
          },
        ],
      },
    )

    new IamRole(this, 'tfc-iam-oidc-provider-role', {
      assumeRolePolicy: rolePolicyDoc.json,
      managedPolicyArns: ['arn:aws:iam::aws:policy/AdministratorAccess'],
      name: 'alicization-tfc-iam-oidc-provider-role',
    })
  }
}
