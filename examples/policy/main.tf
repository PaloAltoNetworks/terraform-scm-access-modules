locals {
  base_path_yaml = yamldecode(file("${path.module}/data/config.yaml"))
  base_path_json = jsondecode(file("${path.module}/data/config.json"))
}


# module "security_policy" {
#   source                 = "PaloAltoNetworks/access-modules/scm//modules/policy"
#   security_rules         = var.security_rules
#   services               = var.services
#   service_groups         = var.service_groups
#   addresses              = var.addresses
#   address_groups         = var.address_groups
#   tags                   = var.tags
#   schedules              = var.schedules # Currently assigning a schedule to a rule is not supported
#   app_override_rules     = var.app_override_rules
#   external_dynamic_lists = var.external_dynamic_lists
#   qos_policy_rules       = var.qos_policy_rules
# }

module "security_policy_with_yaml" {
  source         = "PaloAltoNetworks/access-modules/scm//modules/policy"
  version        = "0.1.4"
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

