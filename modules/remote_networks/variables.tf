variable "ike_crypto_profiles" {
  type        = map(any)
  description = "Map of IKE Crypto Profiles to Generate"
  default     = null
}

variable "ipsec_crypto_profiles" {
  type        = map(any)
  description = "Map of IPSec Crypto Profiles to Generate"
  default     = {}
}

variable "remote_networks" {
  type        = map(any)
  description = "Map of Remote Networks to build"
  default     = {}
}

variable "ike_gateways" {
  type        = map(any)
  description = "Map of IKE Gateways to build"
  default     = {}
}

variable "ipsec_tunnels" {
  type        = map(any)
  description = "Map of IPSEC Tunnels"
  default     = {}
}

variable "spns" {
  description = "List of SPNs to reference with the allocated bandwidth"
  type        = map(any)
  default     = {}
}