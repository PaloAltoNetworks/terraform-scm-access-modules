
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.2 |
| <a name="requirement_scm"></a> [scm](#requirement\_scm) | 0.6.0 |
| <a name="requirement_terracurl"></a> [terracurl](#requirement\_terracurl) | 1.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scm"></a> [scm](#provider\_scm) | 0.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_crypto_profiles"></a> [crypto\_profiles](#module\_crypto\_profiles) | PaloAltoNetworks/access-modules/scm//modules/ipsec | 0.1.6 |
| <a name="module_custom_details"></a> [custom\_details](#module\_custom\_details) | PaloAltoNetworks/access-modules/scm//modules/custom_data | 0.1.6 |
| <a name="module_remote_networks_with_yaml"></a> [remote\_networks\_with\_yaml](#module\_remote\_networks\_with\_yaml) | PaloAltoNetworks/access-modules/scm//modules/remote_networks | 0.1.6 |
| <a name="module_tunnels"></a> [tunnels](#module\_tunnels) | PaloAltoNetworks/access-modules/scm//modules/ipsec | 0.1.6 |

## Resources

| Name | Type |
|------|------|
| [scm_ike_gateway_list.before](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.6.0/docs/data-sources/ike_gateway_list) | data source |
| [scm_ipsec_tunnel_list.before](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.6.0/docs/data-sources/ipsec_tunnel_list) | data source |
| [scm_remote_network_list.before](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.6.0/docs/data-sources/remote_network_list) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ike_crypto_profiles"></a> [ike\_crypto\_profiles](#input\_ike\_crypto\_profiles) | n/a | `map` | `{}` | no |
| <a name="input_ipsec_crypto_profiles"></a> [ipsec\_crypto\_profiles](#input\_ipsec\_crypto\_profiles) | n/a | `map` | `{}` | no |
| <a name="input_ipsec_tunnels"></a> [ipsec\_tunnels](#input\_ipsec\_tunnels) | n/a | `map` | `{}` | no |
| <a name="input_remote_networks"></a> [remote\_networks](#input\_remote\_networks) | n/a | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bandwidth_allocations"></a> [bandwidth\_allocations](#output\_bandwidth\_allocations) | output "remote\_networks\_before" { value = data.scm\_remote\_network\_list.before }  output "ipsec\_tunnels\_before" { value = data.scm\_ipsec\_tunnel\_list.before }  output "ike\_gateways\_before" { value = data.scm\_ike\_gateway\_list.before } |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->