locals {
  remote_networks = yamldecode(file("./data/config.yaml"))["remote_networks"]
  creds           = jsondecode(file("./creds.json"))
  ike_restructure = {
    for k, v in local.remote_networks :
    k => {
      for t, i in v.ipsec : t => merge(i.ike_gateway, { folder = v.folder })
    }
  }
  ike_gateways_list = [for k, v in local.ike_restructure : { for t, i in v : "${k}-${t}-ikegw" => i }]
  ike_gateways      = merge(local.ike_gateways_list...)
  ipsec_restructure = {
    for k, v in local.remote_networks :
    k => {
      for t, i in v.ipsec : t =>
      {
        folder   = try(v.folder, "Remote Networks"),
        auto_key = merge(i.auto_key, { ike_gateways = [{ name = "${k}-${t}-ikegw" }] })
      }
    }
  }
  ipsec_tunnels_list = [for k, v in local.ipsec_restructure : { for t, i in v : "${k}-${t}" => i }]
  ipsec_tunnels      = merge(local.ipsec_tunnels_list...)

  # rn_to_tunnel_data_restructure = {
  #   for k, v in module.tunnels.tunnel_data :
  #   split("-", k)[0] => merge(v, { name = k })...
  # }
  # rn_to_tunnel_data_map     = { for k, v in local.rn_to_tunnel_data_restructure : k => { for t in v : t.name => t } }
  bandwidth_allocations_map = jsondecode(module.custom_details.custom_data["bandwidth-allocations"])
  bandwidth_allocations     = { for ba in local.bandwidth_allocations_map["data"] : ba.name => ba }
}
