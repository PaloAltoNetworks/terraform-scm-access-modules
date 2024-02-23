resource "scm_ike_crypto_profile" "this" {
  for_each                = try(var.ike_crypto_profiles, {})
  dh_groups               = try(each.value.dh_group, ["group2"])        # Default to group2
  encryptions             = try(each.value.encryption, ["aes-256-cbc"]) # Default to aes-256-cbc
  folder                  = "Remote Networks"                           # Update for NGFW support, not to lock to RNs only
  hashes                  = try(each.value.hash, ["sha1"])              # Default to sha1
  name                    = each.key
  authentication_multiple = null
  snippet                 = null
  lifetime                = null
  device                  = null
}

resource "scm_ipsec_crypto_profile" "this" {
  for_each = try(var.ipsec_crypto_profiles, {})
  folder   = "Remote Networks" # Update for NGFW support, not to lock to RNs only
  esp = {
    authentications = try(each.value.esp.authentication, null)
    encryptions     = try(each.value.esp.encryption, null)
  }
  ah = try(each.value.ah, null)
  lifetime = {
    days    = try(each.value.lifetime.days, null)
    minutes = try(each.value.lifetime.minutes, null)
    seconds = try(each.value.lifetime.seconds, null)
    hours   = try(each.value.lifetime.hours, null)
  }
  name     = each.key
  dh_group = try(each.value.dh_group, null)
  lifesize = try({
    gb = try(each.value.lifesize.gb, null)
    kb = try(each.value.lifesize.kb, null)
    mb = try(each.value.lifesize.mb, null)
    tb = try(each.value.lifesize.tb, null)
  }, null)
}

resource "scm_ike_gateway" "this" {
  folder = "Remote Networks"
  name   = "terraform-ike-6"
  authentication = {
    pre_shared_key = {
      key = "mytestkey1234"
    }
  }
  peer_address = {
    ip = "81.107.85.198"
  }
  protocol = {
    ikev1 = {
      dpd = {
        enable = true
      }
      ike_crypto_profile = "PaloAlto-Networks-IKE-Crypto"
    }
    version = "ikev1"
  }
}

resource "scm_ipsec_tunnel" "this" {
  for_each = try(var.ipsec_tunnels, {})
  folder   = try(each.value.folder, "Remote Networks") # Default to Remote Networks
  name     = each.key
  auto_key = {
    ike_gateways         = try(each.value.auto_key.ike_gateway, null)          # Fail the resource build, ike_gateway required
    ipsec_crypto_profile = try(each.value.auto_key.ipsec_crypto_profile, null) # Fail to the resource build, profile required
    proxy_ids            = null
    #    proxy_id = {
    #      name = ""
    #      protocol = {
    #        number = -1
    #        tcp = {
    #          local_port = 99
    #          remote_port = 99
    #        }
    #        udp = {
    #          local_port = 99
    #          remote_port = 99
    #        }
    #      }
    #    }
    #  }
    tunnel_monitor           = try(each.value.tunnel_monitor, null)           # {destination_ip = ""}
    anti_replay              = try(each.value.anti_replay, null)              # boolean
    copy_tos                 = try(each.value.copy_tos, null)                 # boolean
    enable_gre_encapsulation = try(each.value.enable_gre_encapsulation, null) # boolean
  }
}

resource "scm_remote_network" "this" {
  for_each     = try(var.remote_networks, {})
  folder       = try(each.value.folder, "Remote Networks") # Default to Remote Networks Folder
  license_type = try(each.value.license_type, "FWAAS-AGGREGATE")
  name         = each.key
  region       = try(each.value.region, null) # Fail out no region was set, required parameter
  #  spn_name     = try(var.spns[each.value.region].spns[0], null) # Fail out no spn was set, required parameter TODO
  spn_name = try(var.spns[0], null) # Fail out no spn was set, required parameter

  ipsec_tunnel = try(each.value.ipsec_tunnel, null) # Fail out no ipsec tunnel was set, required parameter
}

#locals {
#  spn_name = var.spns["us-southeast"]
#}
#
#output "spn_name" {
#  value = local.spn_name
#}

#output "rns" {
#  # Map that consists of the makeup for a remote network. The Remote Network name is the key
#  # and the value is a map of the remote network dependencies. The value map consists of the
#  # associated IKE gateway, IPsec tunnel, and SPN name, and Crypto Profiles.
#  # Example Map:
#  # {
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  # }
#  value = {
#    for rn in scm_remote_network.this : rn.name => {
#      ike_gateway = rn.value.ike_gateway
#      ipsec_tunnel = rn.value.ipsec_tunnel
#      spn_name = rn.value.spn_name
#      crypto_profiles = {
#        ike = rn.value.ike_crypto_profile
#        ipsec = rn.value.ipsec_crypto_profile
#      }
#    }
#  }
#}