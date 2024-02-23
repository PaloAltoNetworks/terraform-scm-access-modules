variable "dns_security_profiles" {
  type        = map(any)
  description = "SCM DNS Security Profiles"
  default     = {}
}
variable "file_blocking_profiles" {
  type        = map(any)
  description = "SCM File Blocking Profiles"
  default     = {}
}
variable "anti_spyware_profiles" {
  type        = any
  description = "SCM Anti Spyware Profiles"
  default     = {}
}

variable "wildfire_anti_virus_profiles" {
  type        = any
  description = "SCM Wildfire Anti Virus Profiles"
  default     = {}
}

variable "vulnerability_protection_profiles" {
  type        = map(any)
  description = "SCM Vulnerability Protection Profiles"
  default     = {}
}

variable "profile_groups" {
  type        = map(any)
  description = "SCM Profile Groups"
  default     = {}
}