
data "scm_remote_network_list" "before" {
  folder = "Remote Networks"
}

data "scm_ipsec_tunnel_list" "before" {
  folder = "Remote Networks"
}

data "scm_ike_gateway_list" "before" {
  folder = "Remote Networks"
}

#data "scm_bandwidth_allocation_list" "this" {
#  # All Bandwidth Allocations Listed  # Currnetly not supported in the new SCM provider
#}
