## Policy Module

This Terraform Module creates a Policy and Objects to be managed by Palo Alto Networks
Prisma scm service.

## Example

```terraform
#
# main.tf
#

provider "scm" {
  client_id     = "sa@email.com"
  client_secret = "supersecret"
  scope         = "profile tsg_id:{tsg_id} email"
  host          = "api.sase.paloaltonetworks.com"
}

locals {
  base_path_yaml = yamldecode(file("${path.module}/data/config.yaml"))
  base_path_json = jsondecode(file("${path.module}/data/config.json"))
}

module "security_policy_with_yaml" {
  source         = "PaloAltoNetworks/access-modules/scm//modules/policy"
  version        = "0.1.5"
  tags           = local.base_path_yaml["tags"]
  security_rules = local.base_path_yaml["security_rules"]
  services       = local.base_path_yaml["services"]
  service_groups = local.base_path_yaml["service_groups"]
  addresses      = local.base_path_yaml["addresses"]
  address_groups = local.base_path_yaml["address_groups"]
  schedules      = local.base_path_yaml["schedules"]
  # app_override_rules     = local.base_path_yaml["app_override_rules"] # Bug with string to int64 conversions
  external_dynamic_lists = local.base_path_yaml["external_dynamic_lists"]
  qos_policy_rules       = local.base_path_yaml["qos_policy_rules"]
  decryption_rules       = local.base_path_yaml["decryption_rules"]
}

```

## Instructions

1. Define a `main.tf` file that calls the module and provides any required and
optional variables.
2. Define a `variables.tf` file that declares the variables that will be
utilized.
3. (OPTIONAL) Define an `outputs.tf` file to capture and display the module
return values.
4. (OPTIONAL) Create the directory `data/`.
5. (OPTIONAL) Add `config.yaml` or `config.json` to the `data/` directory.
6. (OPTIONAL) Define a `terraform.tfvars` file containing the required
variables and associated values.
7. Initialize the providers and modules with the `terraform init` command.
8. Validate the plan using the `terraform plan` command.
9. Apply the plan using the `terraform apply` command. 

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_scm"></a> [scm](#requirement\_scm) | 0.6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security_policy_with_yaml"></a> [security\_policy\_with\_yaml](#module\_security\_policy\_with\_yaml) | PaloAltoNetworks/access-modules/scm//modules/policy | 0.1.4 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_groups"></a> [address\_groups](#input\_address\_groups) | n/a | `map` | `{}` | no |
| <a name="input_addresses"></a> [addresses](#input\_addresses) | n/a | `map` | `{}` | no |
| <a name="input_app_override_rules"></a> [app\_override\_rules](#input\_app\_override\_rules) | n/a | `map` | `{}` | no |
| <a name="input_external_dynamic_lists"></a> [external\_dynamic\_lists](#input\_external\_dynamic\_lists) | n/a | `map` | `{}` | no |
| <a name="input_qos_policy_rules"></a> [qos\_policy\_rules](#input\_qos\_policy\_rules) | n/a | `map` | `{}` | no |
| <a name="input_qos_profiles"></a> [qos\_profiles](#input\_qos\_profiles) | n/a | `map` | `{}` | no |
| <a name="input_schedules"></a> [schedules](#input\_schedules) | n/a | `map` | `{}` | no |
| <a name="input_security_rules"></a> [security\_rules](#input\_security\_rules) | n/a | `any` | `{}` | no |
| <a name="input_service_groups"></a> [service\_groups](#input\_service\_groups) | n/a | `map` | `{}` | no |
| <a name="input_services"></a> [services](#input\_services) | n/a | `map` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_objects"></a> [objects](#output\_objects) | n/a |
| <a name="output_policy"></a> [policy](#output\_policy) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->