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

#WITH YAML

module "security_policy_with_yaml" {
  source         = "../../modules/policy"
  security_rules = yamldecode(file("${path.module}/data/config.yaml"))["security_rules"]
  services       = yamldecode(file("${path.module}/data/config.yaml"))["services"]
  service_groups = yamldecode(file("${path.module}/data/config.yaml"))["service_groups"]
  addresses      = yamldecode(file("${path.module}/data/config.yaml"))["addresses"]
  address_groups = yamldecode(file("${path.module}/data/config.yaml"))["address_groups"]
  tags                   = yamldecode(file("${path.module}/data/config.yaml"))["tags"]
  schedules              = yamldecode(file("${path.module}/data/config.yaml"))["schedules"]
#  app_override_rules     = yamldecode(file("${path.module}/data/config.yaml"))["app_override_rules"]
  external_dynamic_lists = yamldecode(file("${path.module}/data/config.yaml"))["external_dynamic_lists"]
  qos_policy_rules       = yamldecode(file("${path.module}/data/config.yaml"))["qos_policy_rules"]
}

#WITH JSON

module "security_policy_with_json" {
  source         = "../../modules/policy"
  security_rules = jsondecode(file("${path.module}/data/config.json"))["security_rules"]
  services       = jsondecode(file("${path.module}/data/config.json"))["services"]
  service_groups = jsondecode(file("${path.module}/data/config.json"))["service_groups"]
  addresses      = jsondecode(file("${path.module}/data/config.json"))["addresses"]
  address_groups = jsondecode(file("${path.module}/data/config.json"))["address_groups"]
  tags                   = jsondecode(file("${path.module}/data/config.json"))["tags"]
  schedules              = jsondecode(file("${path.module}/data/config.json"))["schedules"]
#  app_override_rules     = jsondecode(file("${path.module}/data/config.json"))["app_override_rules"]
  external_dynamic_lists = jsondecode(file("${path.module}/data/config.json"))["external_dynamic_lists"]
  qos_policy_rules       = jsondecode(file("${path.module}/data/config.json"))["qos_policy_rules"]
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

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->