#output "remote_networks_before" {
#  value = data.scm_remote_network_list.before
#}
#
#output "ipsec_tunnels_before" {
#  value = data.scm_ipsec_tunnel_list.before
#}
#
#output "ike_gateways_before" {
#  value = data.scm_ike_gateway_list.before
#}
#
#output "bandwidth_allocations" {
#  value = data.scm_bandwidth_allocation_list.this  ## Currently not support in the new SCM provider
#}

#output "remote_network_deets" {
#  value = module.remote_networks.remote_networks
#}

#output "custom" {
#  value = local.bandwidth_allocations
#}