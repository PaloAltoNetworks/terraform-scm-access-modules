
module "crypto_profiles" {
  source                = "../../modules/ipsec"
  ike_crypto_profiles   = yamldecode(file("./data/config.yaml"))["crypto_profiles"]["ike"]   # These are general crypto profiles
  ipsec_crypto_profiles = yamldecode(file("./data/config.yaml"))["crypto_profiles"]["ipsec"] # These are general crypto profiles
}

module "tunnels" {
  source        = "../../modules/ipsec"
  ike_gateways  = local.ike_gateways
  ipsec_tunnels = local.ipsec_tunnels
  depends_on    = [module.crypto_profiles]
}

module "service_connections" {
  source      = "../../modules/service_connections"
  connections = local.service_connections           # Review locals.tf for data inputs
  tunnels     = local.sc_to_tunnel_data_restructure # Review locals.tf for data restructuring
  depends_on  = [module.tunnels]
}
