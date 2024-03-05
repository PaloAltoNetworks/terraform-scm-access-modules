

resource "scm_remote_network" "this" {
  for_each               = try(var.remote_networks, {})
  folder                 = try(each.value.folder, "Remote Networks") # Default to Remote Networks Folder
  license_type           = try(each.value.license_type, "FWAAS-AGGREGATE")
  name                   = each.key
  region                 = try(each.value.region, null)                                                        # Fail out no region was set, required parameter
  spn_name               = try(var.bandwidth_allocations[try(each.value.region, null)].spn_name_list[0], null) # Fail out no spn was set, required parameter
  ipsec_tunnel           = try(var.tunnels[each.key][0].name, null)                                            # required will fail if null
  secondary_ipsec_tunnel = try(var.tunnels[each.key][1].name, null)
  ecmp_load_balancing    = try(each.value.ecmp_load_balancing, null) # not required
  ecmp_tunnels           = try(each.value.ecmp_tunnels, null)        # not required
  protocol               = try(each.value.protocol, null)            # not required
  subnets                = try(each.value.subnets, null)             # not required
}
