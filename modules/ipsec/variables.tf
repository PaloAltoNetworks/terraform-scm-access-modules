variable "ike_crypto_profiles" {
  type        = map(any)
  description = "Map of IKE Crypto Profiles to Generate"
  default     = {}
}

variable "ipsec_crypto_profiles" {
  type        = map(any)
  description = "Map of IPSec Crypto Profiles to Generate"
  default     = {}
}

variable "ike_gateways" {
  type        = any
  description = "Map of IKE Gateways to build"
  default     = {}
}

variable "ipsec_tunnels" {
  type        = map(any)
  description = "Map of IPSEC Tunnels"
  default     = {}
}
