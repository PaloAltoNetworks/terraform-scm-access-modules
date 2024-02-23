## Hip Module

This Terraform Module creates HIP Objects and Profiles to be managed by Palo Alto Networks
Prisma SASE service.

## Example

```terraform
#
# main.tf
#

provider "sase" {
  client_id     = "sa@email.com"
  client_secret = "supersecret"
  scope         = "profile tsg_id:{tsg_id} email"
}

#WITH YAML

module "hip_with_yaml" {
  source   = "../../modules/hip"
  objects  = yamldecode(file("./data/config.yaml")).objects
  profiles = yamldecode(file("./data/config.yaml")).profiles
}

#WITH JSON

module "hip_with_json" {
  source   = "../../modules/hip"
  objects  = jsondecode(file("./data/config.json")).objects
  profiles = jsondecode(file("./data/config.json")).profiles
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
| [scm_hip_object.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/hip_object) | resource |
| [scm_hip_profile.this](https://registry.terraform.io/providers/PaloAltoNetworks/scm/0.1.2/docs/resources/hip_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_objects"></a> [objects](#input\_objects) | **Under Development**<br><br>  **Certificate Attributes Possible Values**:<br>  "['key-usage', 'extended-key-usage', 'subject', 'issuer', 'signature-algorithm', 'serial-no', 'valid-to', 'valid-from',<br>  'subject-alternative-name-url', 'subject-alternative-name-ip', 'subject-alternative-name-email', 'certificate-template-oid', 'certificate-template-name'] | `any` | n/a | yes |
| <a name="input_profiles"></a> [profiles](#input\_profiles) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_objects"></a> [objects](#output\_objects) | Map of Palo Alto Networks HIP Objects |
| <a name="output_profiles"></a> [profiles](#output\_profiles) | Map of Palo Alto Networks HIP Profiles |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->