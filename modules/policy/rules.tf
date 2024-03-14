locals {
  source_list = try({
    for k, v in var.security_rules : k => concat(
      try(v.source_addresses, []),
      try(v.source_address_groups, []),
      try(v.source_regions, []),
      try(v.source_edls, [])
    )
  }, [])

  destination_list = try({
    for k, v in var.security_rules : k => concat(
      try(v.destination_addresses, []),
      try(v.destination_address_groups, []),
      try(v.destination_regions, []),
      try(v.destination_edls, [])
    )
  }, [])

  decryption_source_list = try({
    for k, v in var.decryption_rules : k => concat(
      try(v.decrypt_source_addresses, []),
      try(v.decrypt_source_address_groups, []),
      try(v.decrypt_source_regions, []),
      try(v.decrypt_source_edls, [])
    )
  }, [])

  decryption_destination_list = try({
    for k, v in var.decryption_rules : k => concat(
      try(v.decrypt_dest_addresses, []),
      try(v.decrypt_dest_address_groups, []),
      try(v.decrypt_dest_regions, []),
      try(v.decrypt_dest_edls, [])
    )
  }, [])

  app_source_list = try({
    for k, v in var.app_override_rules : k => concat(
      try(v.source_addresses, []),
      try(v.source_address_groups, []),
      try(v.source_regions, []),
      try(v.source_edls, [])
    )
  }, [])

  app_destination_list = try({
    for k, v in var.app_override_rules : k => concat(
      try(v.destination_addresses, []),
      try(v.destination_address_groups, []),
      try(v.destination_regions, []),
      try(v.destination_edls, [])
    )
  }, [])
}


resource "scm_security_rule" "this" {
  for_each     = try(var.security_rules, {})
  folder       = try(each.value.folder, null) # Fail if no folder
  action       = try(each.value.action, "deny")
  name         = each.key
  sources      = length(local.source_list[each.key]) == 0 ? ["any"] : local.source_list[each.key]
  destinations = length(local.destination_list[each.key]) == 0 ? ["any"] : local.destination_list[each.key]
  services = try(try(each.value.service_groups, null) != null ? each.value.service_groups :
  try(each.value.services, null) != null ? each.value.services : ["application-default"])
  applications       = try(each.value.application, ["any"]) # Default to any application
  categories         = try(each.value.category, ["any"])    # Default to any category
  position           = try(each.value.position, "pre")      # Default to pre rulebase
  source_users       = try(each.value.source_user, ["any"]) # Default to any user
  froms              = try(each.value.from, ["trust"])      # Default to trust
  tos                = try(each.value.to, ["untrust"])      # Default to untrust
  description        = try(each.value.description, null)
  destination_hips   = try(each.value.destination_hip, null)
  source_hips        = try(each.value.source_hip, null)
  disabled           = try(each.value.disabled, null)
  log_setting        = try(each.value.log_setting, null)
  negate_source      = try(each.value.negate_source, false)
  negate_destination = try(each.value.negate_destination, false)
  profile_setting    = try(each.value.profile_setting, null)
  tags               = try(each.value.tags, null)
  device             = null
  snippet            = null
  depends_on = [
    scm_service_group.this,
    scm_service.this,
    scm_address_object.this,
    scm_address_group.this,
    scm_external_dynamic_list.this,
    scm_tag.this,
    scm_schedule.this
  ]
}

resource "scm_decryption_rule" "this" {
  for_each           = try(var.decryption_rules, {})
  name               = each.key
  folder             = try(each.value.folder, null) # Fail if no folder
  type               = try(each.value.type, null)   # Required, will fail if not populated
  sources            = length(local.decryption_source_list[each.key]) == 0 ? ["any"] : local.decryption_source_list[each.key]
  destinations       = length(local.decryption_destination_list[each.key]) == 0 ? ["any"] : local.decryption_destination_list[each.key]
  services           = try(each.value.service, [])
  categories         = try(each.value.category, [])
  position           = try(each.value.position, [])
  source_users       = try(each.value.source_user, [])
  froms              = try(each.value.from, ["trust"])
  action             = try(each.value.action, "decrypt")
  tos                = try(each.value.to, ["untrust"])
  description        = try(each.value.description, null)
  destination_hips   = try(each.value.destination_hip, null)
  disabled           = try(each.value.disabled, null)
  log_setting        = try(each.value.log_setting, null)
  negate_source      = try(each.value.negate_source, false)
  negate_destination = try(each.value.negate_destination, false)
  tags               = try(each.value.tags, null)
  profile            = try(each.value.profile, null)
  source_hips        = try(each.value.source_hip, null)
  log_fail           = try(each.value.log_fail, null)
  log_success        = try(each.value.log_success, null)
  depends_on = [
    scm_service_group.this,
    scm_service.this,
    scm_address_object.this,
    scm_address_group.this,
    scm_tag.this,
    scm_external_dynamic_list.this,
    scm_schedule.this
  ]
}

resource "scm_app_override_rule" "this" {
  for_each           = try(var.app_override_rules, {})
  folder             = try(each.value.folder, null) # Required
  name               = each.key                     # Required
  position           = try(each.value.position, "pre")
  description        = try(each.value.description, null)
  application        = try(each.value.application, null) # Required
  destinations       = length(local.app_destination_list[each.key]) == 0 ? ["any"] : local.app_destination_list[each.key]
  sources            = length(local.app_source_list[each.key]) == 0 ? ["any"] : local.app_source_list[each.key] # Source Regions not supported
  port               = try(tonumber(each.value.port), null)                                                     # Required
  protocol           = try(each.value.protocol, null)                                                           # Required
  tos                = try(each.value.to, ["untrust"])                                                          # Required
  froms              = try(each.value.from, ["trust"])                                                          # Required
  disabled           = try(each.value.disabled, false)
  group_tag          = try(each.value.group_tag, null)
  negate_destination = try(each.value.negate_destination, false)
  negate_source      = try(each.value.negate_source, false)
  tags               = try(each.value.tags, null)
  device             = null
  snippet            = null
  depends_on = [
    scm_tag.this,
    scm_address_object.this,
    scm_address_group.this,
    scm_external_dynamic_list.this
  ]
}

resource "scm_qos_policy_rule" "this" {
  for_each    = try(var.qos_policy_rules, {})
  folder      = try(each.value.folder, "Shared") # Required
  name        = each.key
  description = try(each.value.description, null)
  action      = try(each.value.action, null)
  position    = try(each.value.position, "pre")
  dscp_tos    = try(each.value.dscp_tos, null)
  schedule    = try(each.value.schedule, null)
  depends_on = [
    scm_schedule.this
  ]
}

resource "scm_decryption_exclusion" "this" {
  for_each    = try(var.decryption_exclusions, {})
  folder      = try(each.value.folder, "Shared") # Required
  description = try(each.value.description, null)
  name        = each.key
}