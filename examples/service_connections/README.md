## Policy Module

This Terraform Module creates a Service Connections to be managed by Palo Alto Networks Prisma Access on Strata Cloud Manager.

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

module "crypto_profiles" {
  source                = "../../modules/ipsec"
  ike_crypto_profiles   = yamldecode(file("./data/config.yaml"))["crypto_profiles"]["ike"]   # These are general crypto profiles
  ipsec_crypto_profiles = yamldecode(file("./data/config.yaml"))["crypto_profiles"]["ipsec"] # These are general crypto profiles
}

module "tunnels" {
  source        = "../../modules/ipsec"
  ike_gateways  = local.ike_gateways
  ipsec_tunnels = local.ipsec_tunnels
  depends_on    = [module.crypto_profiles]
}

module "service_connections" {
  source      = "../../modules/service_connections"
  connections = local.service_connections           # Review locals.tf for data inputs
  tunnels     = local.sc_to_tunnel_data_restructure # Review locals.tf for data restructuring
  depends_on  = [module.tunnels]
}
```

```terraform
#
# locals.tf
#

locals {
  service_connections = yamldecode(file("./data/config.yaml"))["service_connections"]
  ike_restructure = { for k, v in local.service_connections :
    k => { for t, i in v.ipsec : t => merge(i.ike_gateway, { folder = v.folder })
    }
  }
  ike_gateways_list = [for k, v in local.ike_restructure : { for t, i in v : "${k}-${t}-ikegw" => i }]
  ike_gateways      = merge(local.ike_gateways_list...)
  ipsec_restructure = { for k, v in local.service_connections :
    k => { for t, i in v.ipsec : t =>
      {
        folder   = try(v.folder, "Service Connections"),
        auto_key = merge(i.auto_key, { ike_gateways = [{ name = "${k}-${t}-ikegw" }] })
      }
    }
  }
  ipsec_tunnels_list = [for k, v in local.ipsec_restructure : { for t, i in v : "${k}-${t}" => i }]
  ipsec_tunnels      = merge(local.ipsec_tunnels_list...)

  sc_to_tunnel_data_restructure = { for k, v in module.tunnels.tunnel_data :
  split("-", k)[0] => merge(v, { name = k })... }
  sc_to_tunnel_data_map = { for k, v in local.sc_to_tunnel_data_restructure : k => { for t in v : t.name => t } }
}
```

**Note:** All logic for processing the configuration structure is handled in the _locals.tf_ file. You can choose to present the data in any format you like, as long as the data is structured correctly.

## Instructions

1. Define a `main.tf` file that calls the module and provides any required and
optional variables.
2. Create the directory `data/`.
3. Add `config.yaml` to the `data/` directory.
4. (OPTIONAL) Define an `outputs.tf` file to capture and display the module
return values.
5. Initialize the providers and modules with the `terraform init` command.
6. Validate the plan using the `terraform plan` command.
7. Apply the plan using the `terraform apply` command. 

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_scm"></a> [scm](#requirement\_scm) | 0.5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_crypto_profiles"></a> [crypto\_profiles](#module\_crypto\_profiles) | ../../modules/ipsec | n/a |
| <a name="module_service_connections"></a> [service\_connections](#module\_service\_connections) | ../../modules/service_connections | n/a |
| <a name="module_tunnels"></a> [tunnels](#module\_tunnels) | ../../modules/ipsec | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->