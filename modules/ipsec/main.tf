resource "scm_ike_crypto_profile" "this" {
  for_each                = try(var.ike_crypto_profiles, {})
  dh_groups               = try(each.value.dh_group, ["group2"])        # Default to group2
  encryptions             = try(each.value.encryption, ["aes-256-cbc"]) # Default to aes-256-cbc
  folder                  = try(each.value.folder, null)                # Required
  hashes                  = try(each.value.hash, ["sha1"])              # Default to sha1
  name                    = each.key
  authentication_multiple = null
  snippet                 = null
  lifetime                = null
  device                  = null
}

resource "scm_ipsec_crypto_profile" "this" {
  for_each = try(var.ipsec_crypto_profiles, {})
  folder   = try(each.value.folder, null) # Required
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
  for_each       = try(var.ike_gateways, {})
  folder         = try(each.value.folder, null)       # Required
  peer_address   = try(each.value.peer_address, null) # Required
  name           = each.key
  authentication = try(each.value.authentication, null) # required
  protocol       = try(each.value.protocol, null)       # required
}

resource "scm_ipsec_tunnel" "this" {
  for_each                 = try(var.ipsec_tunnels, {})
  folder                   = try(each.value.folder, null) # Required
  name                     = each.key
  snippet                  = try(each.value.snippet, null)
  device                   = try(each.value.device, null)
  auto_key                 = try(each.value.auto_key, null)                  # Required
  tunnel_monitor           = try(each.value.tunnel_monitor, null)            # {destination_ip = ""}
  anti_replay              = try(each.value.anti_replay, false)              # boolean
  copy_tos                 = try(each.value.copy_tos, false)                 # boolean
  enable_gre_encapsulation = try(each.value.enable_gre_encapsulation, false) # boolean
  depends_on               = [scm_ike_crypto_profile.this, scm_ipsec_crypto_profile.this, scm_ike_gateway.this]
}