variable "tags" {
  type        = map(any)
  description = "A map of tags to add to security rules"
  default     = {}
}

variable "services" {
  type        = map(any)
  description = "A map of services to create"
  default     = {}
}

variable "service_groups" {
  type        = map(any)
  description = "A map of service groups to create"
  default     = {}
}

variable "addresses" {
  type        = any
  description = "A map of addresses to create"
  default     = {}
}

variable "address_groups" {
  type        = map(any)
  description = "A map of address groups to create"
  default     = {}
}

variable "schedules" {
  type        = any
  description = "A map of schedules to create"
  default     = {}
}

variable "security_rules" {
  type        = any
  description = "A map of security rules to create"
  default     = {}
}

variable "decryption_rules" {
  type        = map(any)
  description = "A map of decryption rules to create"
  default     = {}
}

variable "qos_policy_rules" {
  type    = any
  default = {}
}
variable "app_override_rules" {
  type    = any
  default = {}
}
variable "qos_profiles" {
  type    = any
  default = {}
}

variable "external_dynamic_lists" {
  type        = any
  description = "A map of external dynamic lists to create"
  default     = {}
}

variable "decryption_exclusions" {
  type        = any
  description = "A list of decryption exclusions to create"
  default     = {}
}