# pull doc info from here: https://github.com/PaloAltoNetworks/terraform-provider-sase/blob/main/docs/resources/objects_hip_objects.md#nestedatt--anti_malware--criteria

objects = {
  terraform-hip-xdr = {
    folder      = "Shared"
    description = "Check if Cortex XDR is installed and running"
    anti_malware = {
      criteria = {
        is_installed = true # Boolean only values
        last_scan_time = {
          not_available = true
        }
        #        product_version = {
        #          greater_than = "2" This is broken in the Provider right now because integer responses are being returned as strings
        #        }
        real_time_protection = "yes" # Possible Values are ["yes", "no"]
        virdef_version = {
          #          within = { is currently broken in the provider because version and days defaults are being enforced instead of either or
          #            days = 7 Days
          #            versions = 2
          #          }
        }
      }
      vendor = [
        {
          name    = "Palo Alto Networks"
          product = ["Cortex XDR"]
        }
      ]
    }
  }
  terraform-disk-encrypt-fv = {
    # Apparently there is character limit of 31 characters for the name of the object???
    folder      = "Mobile Users"
    description = "Check if FileVault is enabled and running"
    disk_encryption = {
      criteria = {
        is_installed = true # Boolean only values
        encrypted_locations = [
          {
            name = "Macintosh HD"
            #            encryption_state = { # Broken because both values are being enforced, when it should be either or
            #              is = "encrypted" # Possible Values are ["encrypted", "unencrypted", "partial"
            #              is_not = "unencrypted
            #            }
          }
        ]
      }
      vendor = [
        {
          name    = "Apple Inc."
          product = ["FileVault"]
        }
      ]
    }
  }
  terraform-win-firewall = {
    folder      = "Shared"
    description = "Check if Windows Firewall is installed and running"
    firewall = {
      criteria = {
        is_installed = true  # Boolean only values
        is_enabled   = "yes" # Boolean only values
      }
      vendor = [
        {
          name    = "Microsoft Corporation"
          product = ["Windows Firewall"]
        }
      ]
    }
  }
  terraform-wifi-check = {
    folder      = "Shared"
    description = "Check if the host is connected to the MyCorpWifi network"
    network_info = {
      criteria = {
        network = {
          is = {
            wifi = {
              ssid = "MyCorpWifi"
            }
          }
        }
      }
    }
  }
  terraform-hosti-id = {
    folder      = "Shared"
    description = "Check if the host is a Mac and is a member of the MyCorp domain"
    host_info = {
      criteria = {
        domain = {
          is = "mycorp.com"
        }
        #        os = { Broken because defaults are being enforced for all vendors....
        #          contains = {
        #            Apple = "Mac OS X 13.2"
        #          }
        #        }
        host_name = {
          contains = "mycorp"
        }
      }
    }
  }
  terraform-mcafee-dlp = {
    folder      = "Shared"
    description = "Check if McAfee DLP is installed and running"
    data_loss_prevention = {
      criteria = {
        is_installed = true  # Boolean only values
        is_enabled   = "yes" # Boolean only values
      }
      vendor = [
        {
          name    = "McAfee, Inc."
          product = ["McAfee DLP Endpoint"]
        }
      ]
    }
  }
  terraform-custom-plist = {
    folder      = "Shared"
    description = "Check if plist is configured correctly"
    custom_checks = {
      criteria = {
        plist = [
          {
            name = "com.apple"
            key = [
              {
                name  = "screensaver"
                value = "60"
              },
              {
                name  = "idleTime"
                value = "600"
              },
              {
                name  = "Safari"
                value = "true"
              }
            ]
          }
        ]
      }
    }
  }
  terraform-custom-regkey = {
    folder      = "Shared"
    description = "Check if registry key is configured correctly"
    custom_checks = {
      criteria = {
        registry_key = [
          {
            name = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System"
            registry_value = [
              {
                name       = "EnableLUA"
                value_data = 1
              }
            ]
          }
        ]
      }
    }
  }
  terraform-process-list = {
    folder      = "Shared"
    description = "Check if process is running"
    custom_checks = {
      criteria = {
        process_list = [
          {
            name    = "firefox"
            running = true
          },
          {
            name    = "CortexXDR.exe"
            running = true
          }
        ]
      }
    }
  }
  terraform-cert-check = {
    folder      = "Shared"
    description = "Check if certificate is installed"
    certificate = {
      criteria = {
        certificate_attributes = [
          {
            name  = "key-usage"
            value = "Digital signature"
          }
        ]
      }
      certificate_profile = null # Set this if a certificate profile exists to validate against
    }
  }
  terraform-patch-check = {
    folder      = "Shared"
    description = "Check if patch management is configured correctly"
    patch_management = {
      criteria = {
        is_installed = true  # Boolean only values
        is_enabled   = "yes" # Boolean only values
        missing_patches = {
          check   = "has-any"
          patches = ["KB123456", "KB123457"]
          severity = {
            greater_equal = 500 # possible values [0-10000] # Possible keys are ["greater_equal", "greater_than", "less_than", "less_equal", "is", "is_not"]
          }
        }
      }
      vendor = [
        {
          name    = "Microsoft Corporation"
          product = ["Microsoft Intune Client"]
        }
      ]
    }
  }
  terraform-disk-bkp = {
    folder      = "Shared"
    description = "Check if disk backup is enabled and configured correctly"
    disk_backup = {
      criteria = {
        is_installed = true  # Boolean only values
        is_enabled   = "yes" # Boolean only values
        last_backup_time = {
          #          within = { BROKEN because both values are being enforced, when it should be either or
          #            days = null
          #            hours = 8
          #          }
        }
      }
      vendor = [
        {
          name    = "Apple Inc."
          product = ["Time Machine"]
        }
      ]
    }
  }
}

profiles = {
  terraform-corp-prof1 = {
    folder      = "Shared"
    description = "Corp Profile Enforcement 1"
    match       = "'terraform-win-firewall' and 'terraform-process-list' and 'terraform-wifi-check' and 'terraform-hip-xdr'"
  }
  terraform-corp-prof2 = {
    folder      = "Shared"
    description = "Corp Profile Enforcement 2"
    match       = "'terraform-patch-check' or 'terraform-disk-bkp' or 'terraform-cert-check' or 'terraform-mcafee-dlp'"
  }
  terraform-custom-prof = {
    folder      = "Shared"
    description = "Custom Check Profile"
    match       = "not 'terraform-process-list'"
  }
}