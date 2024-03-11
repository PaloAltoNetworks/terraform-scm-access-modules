## Remote Networks Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_scm"></a> [scm](#requirement\_scm) | 0.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scm"></a> [scm](#provider\_scm) | 0.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scm_remote_network.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.6.0/docs/resources/remote_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bandwidth_allocations"></a> [bandwidth\_allocations](#input\_bandwidth\_allocations) | A map of bandwidth allocations | `any` | `{}` | no |
| <a name="input_remote_networks"></a> [remote\_networks](#input\_remote\_networks) | Map of Remote Networks to build | `any` | `{}` | no |
| <a name="input_tunnels"></a> [tunnels](#input\_tunnels) | A map of tunnel configurations | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_remote_networks"></a> [remote\_networks](#output\_remote\_networks) | The remote networks that are created and managed by the Palo ALto Networks scm service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->