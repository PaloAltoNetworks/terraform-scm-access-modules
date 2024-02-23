## Security Profiles Module

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
| [scm_anti_spyware_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/anti_spyware_profile) | resource |
| [scm_dns_security_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/dns_security_profile) | resource |
| [scm_file_blocking_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/file_blocking_profile) | resource |
| [scm_profile_group.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/profile_group) | resource |
| [scm_vulnerability_protection_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/vulnerability_protection_profile) | resource |
| [scm_wildfire_anti_virus_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/wildfire_anti_virus_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anti_spyware_profiles"></a> [anti\_spyware\_profiles](#input\_anti\_spyware\_profiles) | Anti Spyware Profiles | `any` | `{}` | no |
| <a name="input_dns_security_profiles"></a> [dns\_security\_profiles](#input\_dns\_security\_profiles) | DNS Security Profiles | `map(any)` | `{}` | no |
| <a name="input_file_blocking_profiles"></a> [file\_blocking\_profiles](#input\_file\_blocking\_profiles) | File Blocking Profiles | `map(any)` | `{}` | no |
| <a name="input_profile_groups"></a> [profile\_groups](#input\_profile\_groups) | SASE Profile Groups | `map(any)` | `{}` | no |
| <a name="input_vulnerability_protection_profiles"></a> [vulnerability\_protection\_profiles](#input\_vulnerability\_protection\_profiles) | SASE Vulnerability Protection Profiles | `map(any)` | `{}` | no |
| <a name="input_wildfire_anti_virus_profiles"></a> [wildfire\_anti\_virus\_profiles](#input\_wildfire\_anti\_virus\_profiles) | SASE Wildfire Anti Virus Profiles | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_profile_groups"></a> [profile\_groups](#output\_profile\_groups) | Map of all Palo Alto Networks profile groups |
| <a name="output_security_profiles"></a> [security\_profiles](#output\_security\_profiles) | Map of all Palo Alto Networks security profiles |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->