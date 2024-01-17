#module "security_policy" {
#  source         = "../../modules/policy"
#  security_rules = var.security_rules
#  services       = var.services
#  service_groups = var.service_groups
#  addresses      = var.addresses
#  address_groups = var.address_groups
#  tags                   = var.tags
#  schedules              = var.schedules # Currently assigning a schedule to a rule is not supported
#  app_override_rules     = var.app_override_rules
#  external_dynamic_lists = var.external_dynamic_lists
#  qos_policy_rules       = var.qos_policy_rules
#}

module "security_policy_with_yaml" {
  source         = "../../modules/policy"
  tags           = yamldecode(file("${path.module}/data/config.yaml"))["tags"]
  security_rules = yamldecode(file("${path.module}/data/config.yaml"))["security_rules"]
  services       = yamldecode(file("${path.module}/data/config.yaml"))["services"]
  service_groups = yamldecode(file("${path.module}/data/config.yaml"))["service_groups"]
  addresses      = yamldecode(file("${path.module}/data/config.yaml"))["addresses"]
  address_groups = yamldecode(file("${path.module}/data/config.yaml"))["address_groups"]
  schedules      = yamldecode(file("${path.module}/data/config.yaml"))["schedules"]
  #  app_override_rules     = yamldecode(file("${path.module}/data/config.yaml"))["app_override_rules"] # Bug with string to int64 conversions
  external_dynamic_lists = yamldecode(file("${path.module}/data/config.yaml"))["external_dynamic_lists"]
  qos_policy_rules       = yamldecode(file("${path.module}/data/config.yaml"))["qos_policy_rules"]
}

#module "security_policy_with_json" {
#  source         = "../../modules/policy"
#  security_rules = jsondecode(file("${path.module}/data/config.json"))["security_rules"]
#  services       = jsondecode(file("${path.module}/data/config.json"))["services"]
#  service_groups = jsondecode(file("${path.module}/data/config.json"))["service_groups"]
#  addresses      = jsondecode(file("${path.module}/data/config.json"))["addresses"]
#  address_groups = jsondecode(file("${path.module}/data/config.json"))["address_groups"]
#  tags                   = jsondecode(file("${path.module}/data/config.json"))["tags"]
#  schedules              = jsondecode(file("${path.module}/data/config.json"))["schedules"]
#  app_override_rules     = jsondecode(file("${path.module}/data/config.json"))["app_override_rules"]
#  external_dynamic_lists = jsondecode(file("${path.module}/data/config.json"))["external_dynamic_lists"]
#  qos_policy_rules       = jsondecode(file("${path.module}/data/config.json"))["qos_policy_rules"]
#}
