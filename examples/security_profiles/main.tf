#module "profiles" {
#  source                            = "../../modules/security_profiles"
#  anti_spyware_profiles             = var.anti_spyware_profiles
#  wildfire_anti_virus_profiles      = var.wildfire_anti_virus_profiles
#  vulnerability_protection_profiles = var.vulnerability_protection_profiles
#  file_blocking_profiles            = var.file_blocking_profiles
#  dns_security_profiles             = var.dns_security_profiles
#  profile_groups                    = var.profile_groups
#  #  depends_on                        = [module.destroy_push]
#}

module "profiles_with_yaml" {
  source                            = "../../modules/security_profiles"
  anti_spyware_profiles             = yamldecode(file("./data/config.yaml"))["anti_spyware_profiles"]
  wildfire_anti_virus_profiles      = yamldecode(file("./data/config.yaml"))["wildfire_anti_virus_profiles"]
  vulnerability_protection_profiles = yamldecode(file("./data/config.yaml"))["vulnerability_protection_profiles"]
  file_blocking_profiles            = yamldecode(file("./data/config.yaml"))["file_blocking_profiles"]
  dns_security_profiles             = yamldecode(file("./data/config.yaml"))["dns_security_profiles"]
  profile_groups                    = yamldecode(file("./data/config.yaml"))["profile_groups"]
  #  depends_on                        = [module.destroy_push]
}

#module "push" {
#  source     = "../../modules/push/create"
#  folders    = "'Mobile Users'" #TODO Enhance to dynamically pull from config
#  depends_on = [module.profiles_with_yaml, module.destroy_push]
#  trigger    = timestamp()
#}
#
#module "destroy_push" {
#  source  = "../../modules/push/destroy"
#  folders = "'Mobile Users'"
#  trigger = timestamp()
#}

#module "profiles_with_json" {
#    source = "../../modules/security_profiles"
#    anti_spyware_profiles = {}
#    wildfire_anti_virus_profiles = {}
#    vulnerability_protection_profiles = jsondecode(file("./data/config.json"))["vulnerability_protection_profiles"]
#    file_blocking_profiles = {}
#    dns_security_profiles = {}
#    profile_groups = jsondecode(file("./data/config.json"))["profile_groups"]
#}