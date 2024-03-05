variable "folder" {
  default = "All"
}

variable "auth_url" {
  description = "Authentication URL to obtain OAUTH Token from Palo Alto Networks"
  type        = string
  default     = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
}

variable "creds" {}

variable "sase_api_url" {
  default = "https://api.sase.paloaltonetworks.com/sse/config/v1"
}

variable "get_config" {
  default = {
    addresses = {
      position = "pre"
    }
    services              = {}
    anti-spyware-profiles = {}
    application-groups    = {}
    decryption-profiles   = {}
    decryption-rules = {
      position = "pre"
    }
    external-dynamic-lists = {}
    file-blocking-profiles = {}
    hip-objects            = {}
    hip-profiles           = {}
    http-header-profiles   = {}
    ike-crypto-profiles = {
      folder = "Remote Networks"
    }
    ike-gateways = {
      folder = "Remote Networks"
    }
    ipsec-crypto-profiles = {
      folder = "Remote Networks"
    }
    ipsec-tunnels = {
      folder = "Remote Networks"
    }
    shared-infrastructure-settings = {}
    internal-dns-servers           = {}
    kerberos-server-profiles       = {}
    ldap-server-profiles           = {}
    local-user-groups : {}
    local-users : {}
    #    agent-profiles: {
    #      folder = "Mobile Users"
    #    }
  }
}