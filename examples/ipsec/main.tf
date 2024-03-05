
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