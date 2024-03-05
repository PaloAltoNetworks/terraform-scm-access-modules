## IPSec Tunnel Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_scm"></a> [scm](#requirement\_scm) | 0.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scm"></a> [scm](#provider\_scm) | 0.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scm_ike_crypto_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.5.0/docs/resources/ike_crypto_profile) | resource |
| [scm_ike_gateway.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.5.0/docs/resources/ike_gateway) | resource |
| [scm_ipsec_crypto_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.5.0/docs/resources/ipsec_crypto_profile) | resource |
| [scm_ipsec_tunnel.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.5.0/docs/resources/ipsec_tunnel) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ike_crypto_profiles"></a> [ike\_crypto\_profiles](#input\_ike\_crypto\_profiles) | Map of IKE Crypto Profiles to Generate | `map(any)` | `{}` | no |
| <a name="input_ike_gateways"></a> [ike\_gateways](#input\_ike\_gateways) | Map of IKE Gateways to build | `any` | `{}` | no |
| <a name="input_ipsec_crypto_profiles"></a> [ipsec\_crypto\_profiles](#input\_ipsec\_crypto\_profiles) | Map of IPSec Crypto Profiles to Generate | `map(any)` | `{}` | no |
| <a name="input_ipsec_tunnels"></a> [ipsec\_tunnels](#input\_ipsec\_tunnels) | Map of IPSEC Tunnels | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tunnel_data"></a> [tunnel\_data](#output\_tunnel\_data) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->