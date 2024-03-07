terraform {
  required_providers {
    terracurl = {
      source  = "devops-rob/terracurl"
      version = "1.2.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
  }
  required_version = ">= 1.4.6"
}


