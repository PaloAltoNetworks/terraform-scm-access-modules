terraform {
  required_providers {
    scm = {
      source  = "PaloAltoNetworks/scm"
      version = "0.5.0"
    }
  }
  required_version = ">= 1.4.6"
}