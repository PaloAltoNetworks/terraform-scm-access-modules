terraform {
  required_providers {
    scm = {
      source  = "PaloAltoNetworks/scm"
      version = ">= 0.6.0"
    }
    terracurl = {
      source  = "devops-rob/terracurl"
      version = ">= 1.2.1"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.2.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.41.0"
    }
  }
  required_version = ">= 1.4.6"
}