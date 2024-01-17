resource "scm_tag" "this" {
  for_each = try(var.tags, {})
  folder   = try(each.value.folder, null) # Fail if not set
  name     = each.key
  color    = try(each.value.color, null)
  comments = try(each.value.comments, null)
  snippet  = null
  device   = null
}

resource "scm_service" "this" {
  for_each = try(var.services, {})
  folder   = try(each.value.folder, null) # Fail if not set
  tags     = try(each.value.tags, null)
  protocol = try(each.value.protocol, null)
  name     = each.key
  snippet  = null
  device   = null
  depends_on = [
    scm_tag.this
  ]
}

resource "scm_service_group" "this" {
  for_each = try(var.service_groups, {})
  folder   = try(each.value.folder, null) # Fail if not set
  name     = each.key
  members  = try(each.value.members, null)
  tags     = try(each.value.tags, null)
  snippet  = null
  device   = null
  depends_on = [
    scm_service.this,
    scm_tag.this
  ]
}

resource "scm_address_object" "this" {
  for_each    = try(var.addresses, {})
  folder      = try(each.value.folder, null) # Fail if not set
  name        = each.key
  description = try(each.value.description, null)
  ip_netmask  = try(each.value.ip_netmask, null)
  ip_range    = try(each.value.ip_range, null)
  ip_wildcard = try(each.value.ip_wildcard, null)
  fqdn        = try(each.value.fqdn, null)
  tags        = try(each.value.tag, null)
  snippet     = null
  device      = null
  depends_on = [
    scm_tag.this
  ]
}

resource "scm_address_group" "this" {
  for_each      = try(var.address_groups, {})
  folder        = try(each.value.folder, null) # Fail if not set
  name          = each.key
  description   = try(each.value.description, null)
  dynamic_value = try(each.value.filter, null)
  static_list   = try(each.value.members, null)
  tags          = try(each.value.tags, null)
  snippet       = null
  device        = null
  depends_on = [
    scm_address_object.this,
    scm_tag.this
  ]
}

resource "scm_schedule" "this" {
  for_each      = try(var.schedules, {})
  folder        = try(each.value.folder, null) # Fail if not set
  name          = each.key
  schedule_type = try(each.value.schedule_type, null) # fail if not set
  snippet       = null
  device        = null
  depends_on    = []
}

resource "scm_external_dynamic_list" "this" {
  for_each = try(var.external_dynamic_lists, {})
  folder   = try(each.value.folder, null) # Fail if not set
  name     = each.key
  type     = try(each.value.type, null) # fail if not set
  snippet  = null
  device   = null
}

resource "scm_qos_profile" "this" {
  for_each             = try(var.qos_profiles, {})
  name                 = each.key
  folder               = try(each.value.folder, "Shared")
  aggregate_bandwidth  = try(each.value.aggregate_bandwidth, null)
  class_bandwidth_type = try(each.value.class_bandwidth_type, null)
  snippet              = null
  device               = null
}
