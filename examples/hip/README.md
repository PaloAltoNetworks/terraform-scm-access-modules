## Hip Module

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

#WITH TFVARS

module "hip_with_tfvars" {
  source   = "../../modules/hip"
  objects  = var.objects
  profiles = var.profiles
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

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hip_with_yaml"></a> [hip\_with\_yaml](#module\_hip\_with\_yaml) | ../../modules/hip | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_objects"></a> [objects](#input\_objects) | Map of HIP Objects | `any` | n/a | yes |
| <a name="input_profiles"></a> [profiles](#input\_profiles) | Map of HIP Profiles | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->