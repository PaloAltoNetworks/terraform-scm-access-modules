ipsec_crypto_definitions = {
  terraform-ipsec-crypto-test1 = {
    lifetime = {
      days = 8
    }
    esp = {
      authentication = ["md5"]         # [md5, sha1, sha256, sha384, sha512]
      encryption     = ["aes-256-cbc"] # [des, 3des, aes-128-cbc, aes-192-cbc, aes-256-cbc, aes-128-gcm, aes-256-gcm, null]
    }
    dh_group = "group5" # [group1, group2, group5, group14, group19, group20, no-pfs]
    lifesize = {
      gb = 1
    }
  }
  terraform-ipsec-crypto-test2 = {
    lifetime = {
      minutes = 3600
    }
    esp = {
      authentication = ["sha1"]        # [md5, sha1, sha256, sha384, sha512]
      encryption     = ["aes-256-gcm"] # [des, 3des, aes-128-cbc, aes-192-cbc, aes-256-cbc, aes-128-gcm, aes-256-gcm, null]
    }
    dh_group = "group14" # [group1, group2, group5, group14, group19, group20, no-pfs]
    lifesize = {
      mb = 1
    }
  }
}
ike_crypto_definitions = {
  terraform-ike-crypto-test1 = {
    dh_group   = ["group5"]      # [group1, group2, group5, group14, group19, group20]]
    encryption = ["aes-256-cbc"] # [des, 3des, aes-128-cbc, aes-192-cbc, aes-256-cbc, aes-128-gcm, aes-256-gcm]
    hash       = ["sha256"]      # [md5, sha1, sha256, sha384, sha512]
  }
  terraform-ike-crypto-test2 = {
    dh_group   = ["group20"]     # [group1, group2, group5, group14, group19, group20]]
    encryption = ["aes-256-gcm"] # [des, 3des, aes-128-cbc, aes-192-cbc, aes-256-cbc, aes-128-gcm, aes-256-gcm]
    hash       = ["sha384"]      # [md5, sha1, sha256, sha384, sha512]
  }
}
remote_networks = {
  terraform-rn-1 = {
    region = "europe-northwest"
    #    spn_name     = "us-southeast-amaryllis"
    ipsec_tunnel = "AWS-VM-1-IPSEC-TUNNEL"
  }
  terraform-rn-2 = {
    region = "us-southeast"
    #    spn_name     = "us-southeast-amaryllis"
    ipsec_tunnel = "AWS-VM-1-IPSEC-TUNNEL"
  }
}
ipsec_tunnels = {
  terraform-ipsec-tunnel1 = {
    auto_key = {
      ike_gateway = [
        {
          name = "terraform-ike-1"
      }]
      ipsec_crypto_profile = "Others-IPSec-Crypto-Default"
    }
    tunnel_monitor           = null # {destination_ip = ""}
    anti_replay              = false
    copy_tos                 = false
    enable_gre_encapsulation = false
  }
  #  terraform-ipsec-tunnel2 = {
  #
  #  }
}
