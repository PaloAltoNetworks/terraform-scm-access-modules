
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.2 |
| <a name="requirement_scm"></a> [scm](#requirement\_scm) | 0.5.0 |
| <a name="requirement_terracurl"></a> [terracurl](#requirement\_terracurl) | 1.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scm"></a> [scm](#provider\_scm) | 0.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_crypto_profiles"></a> [crypto\_profiles](#module\_crypto\_profiles) | ../../modules/ipsec | n/a |
| <a name="module_custom_details"></a> [custom\_details](#module\_custom\_details) | ../../modules/custom_data | n/a |
| <a name="module_remote_networks_with_yaml"></a> [remote\_networks\_with\_yaml](#module\_remote\_networks\_with\_yaml) | ../../modules/remote_networks | n/a |
| <a name="module_tunnels"></a> [tunnels](#module\_tunnels) | ../../modules/ipsec | n/a |

## Resources

| Name | Type |
|------|------|
| [scm_ike_gateway_list.before](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.5.0/docs/data-sources/ike_gateway_list) | data source |
| [scm_ipsec_tunnel_list.before](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.5.0/docs/data-sources/ipsec_tunnel_list) | data source |
| [scm_remote_network_list.before](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.5.0/docs/data-sources/remote_network_list) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ike_crypto_profiles"></a> [ike\_crypto\_profiles](#input\_ike\_crypto\_profiles) | n/a | `map` | `{}` | no |
| <a name="input_ipsec_crypto_profiles"></a> [ipsec\_crypto\_profiles](#input\_ipsec\_crypto\_profiles) | n/a | `map` | `{}` | no |
| <a name="input_ipsec_tunnels"></a> [ipsec\_tunnels](#input\_ipsec\_tunnels) | n/a | `map` | `{}` | no |
| <a name="input_remote_networks"></a> [remote\_networks](#input\_remote\_networks) | n/a | `map` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->