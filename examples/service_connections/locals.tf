locals {
  service_connections = yamldecode(file("./data/config.yaml"))["service_connections"]
  ike_restructure = { for k, v in local.service_connections :
    k => { for t, i in v.ipsec : t => merge(i.ike_gateway, { folder = v.folder })
    }
  }
  ike_gateways_list = [for k, v in local.ike_restructure : { for t, i in v : "${k}-${t}-ikegw" => i }]
  ike_gateways      = merge(local.ike_gateways_list...)
  ipsec_restructure = { for k, v in local.service_connections :
    k => { for t, i in v.ipsec : t =>
      {
        folder   = try(v.folder, "Service Connections"),
        auto_key = merge(i.auto_key, { ike_gateways = [{ name = "${k}-${t}-ikegw" }] })
      }
    }
  }
  ipsec_tunnels_list = [for k, v in local.ipsec_restructure : { for t, i in v : "${k}-${t}" => i }]
  ipsec_tunnels      = merge(local.ipsec_tunnels_list...)

  sc_to_tunnel_data_restructure = { for k, v in module.tunnels.tunnel_data :
  split("-", k)[0] => merge(v, { name = k })... }
  # convert sc_to_tunnel_data_map for key where the value is a list of maps currently, to a map of maps
  sc_to_tunnel_data_map = { for k, v in local.sc_to_tunnel_data_restructure : k => { for t in v : t.name => t } }
}