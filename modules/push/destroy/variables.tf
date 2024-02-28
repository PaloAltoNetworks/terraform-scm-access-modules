variable "folders" {
  description = "List of String Example: Mobile Users, Remote Networks, Mobile Users Explicit Proxy"
}

variable "trigger" {
  description = "timestamp trigger time"
}

variable "destroy_condition" {
  type        = bool
  description = "In development...utilize for conditional create/destroy"
  default     = false
}