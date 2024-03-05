variable "remote_networks" {
  type        = any
  description = "Map of Remote Networks to build"
  default     = {}
}

variable "tunnels" {
  description = "A map of tunnel configurations"
  type        = any
  default     = {}
}

variable "bandwidth_allocations" {
  description = "A map of bandwidth allocations"
  type        = any
  default     = {}
}