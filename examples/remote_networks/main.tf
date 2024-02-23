#module "remote_networks_with_tfvars" {
#  source = "../../modules/remote_networks"
#  ike_crypto_profiles = var.ipsec_crypto_profiles
#  ipsec_crypto_profiles = var.ipsec_crypto_profiles
#  remote_networks = var.remote_networks
##  ike_gateways = var.ike_gateways
#  ipsec_tunnels = var.ipsec_tunnels
#  spns = local.spns
#}


module "remote_networks_with_yaml" {
  source = "../../modules/remote_networks"
  #  ike_crypto_profiles   = yamldecode(file("./data/config.yaml"))["ike_crypto_profiles"]
  #  ipsec_crypto_profiles = yamldecode(file("./data/config.yaml"))["ipsec_crypto_profiles"]
  ike_crypto_profiles   = {}
  ipsec_crypto_profiles = {}
  ike_gateways          = yamldecode(file("./data/config.yaml"))["ike_gateways"] #TODO PSK bug at to moment.
  #  ipsec_tunnels = yamldecode(file("./data/config.yaml"))["ipsec_tunnels"]
  #  spns          = ["europe-northwest-frangipani"]
  #  remote_networks       = yamldecode(file("./data/config.yaml"))["remote_networks"]


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