
module "custom_details" {
  source = "../../modules/custom_data"
  creds  = local.creds
  get_config = {
    bandwidth-allocations = {}
  }
}

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

module "remote_networks_with_yaml" {
  source                = "../../modules/remote_networks"
  bandwidth_allocations = local.bandwidth_allocations
  remote_networks       = local.remote_networks
  tunnels               = local.rn_to_tunnel_data_restructure
  depends_on            = [module.tunnels, module.custom_details, module.crypto_profiles]
}

#module "push" {
#  source     = "../../modules/push"
#  depends_on = [module.remote_networks_with_yaml]
#}

#module "remote_networks_with_json" {
#  source = "../../modules/remote_networks"
#  ike_crypto_profiles = jsondecode(file("./data/config.json"))["ike_crypto_profiles"]
#  ipsec_crypto_profiles = jsondecode(file("./data/config.json"))["ipsec_crypto_profiles"]
#  remote_networks = jsondecode(file("./data/config.json"))["remote_networks"]
##  ike_gateways = jsondecode(file("./data/config.json"))["ike_gateways"]
#  ipsec_tunnels = jsondecode(file("./data/config.json"))["ipsec_tunnels"]
#  spns = local.spns
#}