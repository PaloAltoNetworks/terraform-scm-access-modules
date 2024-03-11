## Security Profiles Module

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
| <a name="module_profiles_with_yaml"></a> [profiles\_with\_yaml](#module\_profiles\_with\_yaml) | ../../modules/security_profiles | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anti_spyware_profiles"></a> [anti\_spyware\_profiles](#input\_anti\_spyware\_profiles) | n/a | `any` | `{}` | no |
| <a name="input_dns_security_profiles"></a> [dns\_security\_profiles](#input\_dns\_security\_profiles) | n/a | `map(any)` | `{}` | no |
| <a name="input_file_blocking_profiles"></a> [file\_blocking\_profiles](#input\_file\_blocking\_profiles) | n/a | `map(any)` | `{}` | no |
| <a name="input_profile_groups"></a> [profile\_groups](#input\_profile\_groups) | n/a | `map(any)` | `{}` | no |
| <a name="input_vulnerability_protection_profiles"></a> [vulnerability\_protection\_profiles](#input\_vulnerability\_protection\_profiles) | n/a | `map(any)` | `{}` | no |
| <a name="input_wildfire_anti_virus_profiles"></a> [wildfire\_anti\_virus\_profiles](#input\_wildfire\_anti\_virus\_profiles) | n/a | `any` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->