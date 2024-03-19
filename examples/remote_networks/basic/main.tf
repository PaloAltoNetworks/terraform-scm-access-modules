module "custom_details" {
  source  = "PaloAltoNetworks/access-modules/scm//modules/custom_data"
  version = "0.1.6"
  creds   = local.creds
  get_config = {
    bandwidth-allocations = {}
  }
}

module "crypto_profiles" {
  source                = "PaloAltoNetworks/access-modules/scm//modules/ipsec"
  version               = "0.1.6"
  ike_crypto_profiles   = yamldecode(file("../data/config.yaml"))["crypto_profiles"]["ike"]   # These are general crypto profiles
  ipsec_crypto_profiles = yamldecode(file("../data/config.yaml"))["crypto_profiles"]["ipsec"] # These are general crypto profiles
}

module "tunnels" {
  source        = "PaloAltoNetworks/access-modules/scm//modules/ipsec"
  version       = "0.1.6"
  ike_gateways  = local.ike_gateways
  ipsec_tunnels = local.ipsec_tunnels
  depends_on    = [module.crypto_profiles]
}

module "remote_networks_with_yaml" {
  source                = "PaloAltoNetworks/access-modules/scm//modules/remote_networks"
  version               = "0.1.6"
  bandwidth_allocations = local.bandwidth_allocations
  remote_networks       = local.remote_networks
  tunnels               = module.tunnels.rn_to_tunnel_data_restructure
  depends_on            = [module.tunnels, module.custom_details, module.crypto_profiles]
}

#provider "scm" {
#  client_id     = "YOURCLIENTID"
#  client_secret = "YOURSASECRET"
#  scope         = "profile tsg_id:YOURTSGID email"
#  host          = "api.sase.paloaltonetworks.com"
#}
#
#provider "terracurl" {}
#provider "null" {}