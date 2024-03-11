## Service Connection Module

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
| [scm_service_connection.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.6.0/docs/resources/service_connection) | resource |
| [scm_service_connection_group.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.6.0/docs/resources/service_connection_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connections"></a> [connections](#input\_connections) | A map of service connections | `map(any)` | `{}` | no |
| <a name="input_tunnels"></a> [tunnels](#input\_tunnels) | A map of tunnel configurations | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_groups"></a> [groups](#output\_groups) | n/a |
| <a name="output_service_connections"></a> [service\_connections](#output\_service\_connections) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->