
locals {
  service_connection_group_map = { for k, v in var.connections :
  v.group => k... if v.group != null }
}


resource "scm_service_connection" "this" {
  for_each               = try(var.connections, {})
  name                   = each.key
  folder                 = try(each.value.folder, "Service Connections") # not required
  ipsec_tunnel           = try(var.tunnels[each.key][0].name, null)      # required will fail if null
  secondary_ipsec_tunnel = try(var.tunnels[each.key][1].name, null)      # not required
  region                 = try(each.value.region, null)                  # required will fail if null
  backup__s_c            = try(each.value.backup__s_c, null)             # not required
  subnets                = try(each.value.subnets, null)                 # not required
  bgp_peer               = try(each.value.bgp_peer, null)                # not required
  source_nat             = try(each.value.source_nat, null)              # not required
  nat_pool               = try(each.value.nat_pool, null)                # not required
  no_export_community    = try(each.value.no_export_community, null)     # not required
  onboarding_type        = try(each.value.onboarding_type, null)         # not required
  protocol               = try(each.value.protocol, null)                # not required
  qos                    = try(each.value.qos, null)                     # not required
}

resource "scm_service_connection_group" "this" {
  for_each   = local.service_connection_group_map
  name       = each.key
  targets    = each.value
  depends_on = [scm_service_connection.this]
}


