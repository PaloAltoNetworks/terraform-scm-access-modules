locals {
  #TODO - make generic model for ipsec tunnels and ike gateways, currently structure is built with Service Connections in mind for generic use
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
}