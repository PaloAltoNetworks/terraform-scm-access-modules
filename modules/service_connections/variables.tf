variable "connections" {
  description = "A map of service connections"
  type        = map(any)
  default     = {}
}

variable "tunnels" {
  description = "A map of tunnel configurations"
  type        = any
  default     = {}
}
