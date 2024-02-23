## Remote Networks Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_scm"></a> [scm](#requirement\_scm) | 0.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scm"></a> [scm](#provider\_scm) | 0.1.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scm_ike_crypto_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/ike_crypto_profile) | resource |
| [scm_ike_gateway.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/ike_gateway) | resource |
| [scm_ipsec_crypto_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/ipsec_crypto_profile) | resource |
| [scm_ipsec_tunnel.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/ipsec_tunnel) | resource |
| [scm_remote_network.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/remote_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ike_crypto_profiles"></a> [ike\_crypto\_profiles](#input\_ike\_crypto\_profiles) | Map of IKE Crypto Profiles to Generate | `map(any)` | `{}` | no |
| <a name="input_ike_gateways"></a> [ike\_gateways](#input\_ike\_gateways) | Map of IKE Gateways to build | `map(any)` | `{}` | no |
| <a name="input_ipsec_crypto_profiles"></a> [ipsec\_crypto\_profiles](#input\_ipsec\_crypto\_profiles) | Map of IPSec Crypto Profiles to Generate | `map(any)` | `{}` | no |
| <a name="input_ipsec_tunnels"></a> [ipsec\_tunnels](#input\_ipsec\_tunnels) | Map of IPSEC Tunnels | `map(any)` | `{}` | no |
| <a name="input_remote_networks"></a> [remote\_networks](#input\_remote\_networks) | Map of Remote Networks to build | `map(any)` | `{}` | no |
| <a name="input_spns"></a> [spns](#input\_spns) | List of SPNs to reference with the allocated bandwidth | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ike_crypto_profiles"></a> [ike\_crypto\_profiles](#output\_ike\_crypto\_profiles) | The IKE crypto profiles that are created and managed by the Palo ALto Networks scm service |
| <a name="output_ipsec_crypto_profiles"></a> [ipsec\_crypto\_profiles](#output\_ipsec\_crypto\_profiles) | The IPSec crypto profiles that are created and managed by the Palo ALto Networks scm service |
| <a name="output_remote_networks"></a> [remote\_networks](#output\_remote\_networks) | The remote networks that are created and managed by the Palo ALto Networks scm service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->