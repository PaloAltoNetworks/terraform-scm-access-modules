## Retrieve Custom Data from SCM Module

This Terraform Module retrieves custom data from Strata Cloud Manager, when data sources are not available in SCM Provider.

## Example

```terraform
#
# main.tf
#

module "custom_details" {
  source = "../../modules/custom_data"
  creds  = local.creds
  get_config = {
    bandwidth-allocations = {}
  }
}
```

## Instructions

1. Define a `main.tf` file that calls the module and provides any required and
optional variables.
2. Define a `creds.json` file that declares credentials to utilize when interacting with SCM APIs via terracurl.
3. Define endpoints you want retrieve data from by modifying _get_config_ with additional endpoint keys within the map.
7. Initialize the providers and modules with the `terraform init` command.
8. Validate the plan using the `terraform plan` command.
9. Apply the plan using the `terraform apply` command. 

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.2 |
| <a name="requirement_terracurl"></a> [terracurl](#requirement\_terracurl) | 1.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.2 |
| <a name="provider_terracurl"></a> [terracurl](#provider\_terracurl) | 1.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.trigger](https://registry.terraform.io/providers/hashicorp/null/3.2.2/docs/resources/resource) | resource |
| [terracurl_request.config](https://registry.terraform.io/providers/devops-rob/terracurl/1.2.1/docs/resources/request) | resource |
| [terracurl_request.session](https://registry.terraform.io/providers/devops-rob/terracurl/1.2.1/docs/resources/request) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_url"></a> [auth\_url](#input\_auth\_url) | Authentication URL to obtain OAUTH Token from Palo Alto Networks | `string` | `"https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"` | no |
| <a name="input_creds"></a> [creds](#input\_creds) | n/a | `any` | n/a | yes |
| <a name="input_folder"></a> [folder](#input\_folder) | n/a | `string` | `"All"` | no |
| <a name="input_get_config"></a> [get\_config](#input\_get\_config) | n/a | `map` | <pre>{<br>  "addresses": {<br>    "position": "pre"<br>  },<br>  "anti-spyware-profiles": {},<br>  "application-groups": {},<br>  "decryption-profiles": {},<br>  "decryption-rules": {<br>    "position": "pre"<br>  },<br>  "external-dynamic-lists": {},<br>  "file-blocking-profiles": {},<br>  "hip-objects": {},<br>  "hip-profiles": {},<br>  "http-header-profiles": {},<br>  "ike-crypto-profiles": {<br>    "folder": "Remote Networks"<br>  },<br>  "ike-gateways": {<br>    "folder": "Remote Networks"<br>  },<br>  "internal-dns-servers": {},<br>  "ipsec-crypto-profiles": {<br>    "folder": "Remote Networks"<br>  },<br>  "ipsec-tunnels": {<br>    "folder": "Remote Networks"<br>  },<br>  "kerberos-server-profiles": {},<br>  "ldap-server-profiles": {},<br>  "local-user-groups": {},<br>  "local-users": {},<br>  "services": {},<br>  "shared-infrastructure-settings": {}<br>}</pre> | no |
| <a name="input_sase_api_url"></a> [sase\_api\_url](#input\_sase\_api\_url) | n/a | `string` | `"https://api.sase.paloaltonetworks.com/sse/config/v1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_data"></a> [custom\_data](#output\_custom\_data) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->