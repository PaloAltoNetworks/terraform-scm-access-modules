variable "security_rules" {
  type    = any
  default = {}
}

variable "services" {
  default = {}
}
variable "service_groups" {
  default = {}
}
variable "address_groups" {
  default = {}
}
variable "tags" {
  default = {}
}
variable "addresses" {
  default = {}
}

variable "schedules" {
  default = {}
}

variable "app_override_rules" {
  default = {}
}

variable "external_dynamic_lists" {
  default = {}
}

variable "qos_policy_rules" {
  default = {}
}

variable "qos_profiles" {
  default = {}
}