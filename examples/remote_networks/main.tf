

module "rn_test" {
  source                = "../../modules/remote_networks"
  ike_crypto_profiles   = yamldecode(file("./data/config.yaml"))["ike_crypto_profiles"]
  ipsec_crypto_profiles = {}
  ike_gateways          = {}
  remote_networks       = {}
}