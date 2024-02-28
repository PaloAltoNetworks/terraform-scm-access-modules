## Create Push Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.push](https://registry.terraform.io/providers/hashicorp/null/3.2.1/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destroy_condition"></a> [destroy\_condition](#input\_destroy\_condition) | In development...utilize for conditional create/destroy | `bool` | `false` | no |
| <a name="input_folders"></a> [folders](#input\_folders) | List of String Example: Mobile Users, Remote Networks, Mobile Users Explicit Proxy | `any` | n/a | yes |
| <a name="input_trigger"></a> [trigger](#input\_trigger) | timestamp trigger everytime | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->