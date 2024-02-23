# Prisma SASE Remote Networks Deployment and Configuration Example

A Terraform example for deploying Prisma SASE Remote Networks in a scalable and repeatable manner using either: 
- yaml
- json
- hcl tfvars

This example can be used to familarize oneself with both Prisma SASE Remote Networks and Terraform - 
it creates everything required to support the deployment and configuration of a remote network.

**NOTE:**
A Remote Network will not go active until peerings are established with the remote site.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version           |
|---------------------------------------------------------------------------|-------------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.8, < 1.4.2 |
| <a name="requirement_sase"></a> [sase](#requirement\_sase)                | ~> 0.1            |

## Providers

No providers.

## Modules

| Name                                                                                | Source                        | Version |
|-------------------------------------------------------------------------------------|-------------------------------|---------|
| <a name="module_remote_networks"></a> [remote\_networks](#module\_remote\_networks) | ../../modules/remote_networks | n/a     |

## Resources

No resources.

| Name                                                                                                  | Description                                        | Type       | Default | Required |
|-------------------------------------------------------------------------------------------------------|----------------------------------------------------|------------|---------|:--------:|
| <a name="input_ipsec_crypto_profiles"></a> [ipsec\_crypto\_profiles](#input\_ipsec\_crypto\_profiles) | n/a                                                | `map(any)` | `{}`    |    no    |
| <a name="input_ike_crypto_profiles"></a> [ike\_crypto\_profiles](#input\_ike\_crypto\_profiles)       | n/a                                                | `map(any)` | `{}`    |    no    |
| <a name="input_ike_gateways"></a> [ike\_gateways](#input\_ike\_gateways)                              | n/a                                                | `map(any)` | `{}`    |    no    |
| <a name="input_remote_networks"></a> [remote\_networks](#input\_remote\_networks)                     | n/a                                                | `map(any)` | `{}`    |    no    |
| <a name="input_ipsec_tunnels"></a> [ipsec\_tunnels](#input\_ipsec\_tunnels)                           | A map of ipsec tunnels to assign to the resources. | `map(any)` | `{}`    |    no    |
| <a name="input_spns"></a> [spns](#input\_spns)                                                        | n/a                                                | `map(any)` | `{}`    |    no    |



## Outputs

TBD.
<!-- END_TF_DOCS -->