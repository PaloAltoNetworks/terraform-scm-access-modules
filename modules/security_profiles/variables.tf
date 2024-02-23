variable "dns_security_profiles" {
  type        = map(any)
  description = "DNS Security Profiles"
  default     = {}
}
variable "file_blocking_profiles" {
  type        = map(any)
  description = "File Blocking Profiles"
  default     = {}
}
variable "anti_spyware_profiles" {
  type        = any
  description = "Anti Spyware Profiles"
  default     = {}
}

variable "wildfire_anti_virus_profiles" {
  type        = any
  description = "SASE Wildfire Anti Virus Profiles"
  default     = {}
}

variable "vulnerability_protection_profiles" {
  type        = map(any)
  description = "SASE Vulnerability Protection Profiles"
  default     = {}
}

variable "profile_groups" {
  type        = map(any)
  description = "SASE Profile Groups"
  default     = {}
}