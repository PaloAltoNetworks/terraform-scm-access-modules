vulnerability_protection_profiles = {
  terraform_vp_profile1 = {
    folder      = "Mobile Users"
    description = "Terraform Example1"
    rules = [
      {
        name = "rule1"
        action = {
          alert = true
        }
        host           = "any"
        cve            = ["CVE-2017-11882"]
        packet_capture = "extended-capture"
        vendor_id      = ["cisco"]
        severity       = ["critical"]
        category       = "exploit-kit"
        threat_name    = "test1"
      },
      {
        name = "rule2"
        action = {
          drop = true
        }
        host           = "any"
        cve            = ["CVE-2017-11882"]
        packet_capture = "single-packet"
        vendor_id      = ["juniper"]
        severity       = ["high"]
        category       = "phishing"
        threat_name    = "test2"
      },
      {
        name = "rule3"
        action = {
          reset_both = true
        }
        host           = "any"
        cve            = ["CVE-2017-11882"]
        packet_capture = "extended-capture"
        vendor_id      = ["microsoft"]
        severity       = ["medium"]
        category       = "code-execution"
        threat_name    = "test3"
      }
    ]
  }
  terraform_shared_vp_profile1 = {
    folder      = "Shared"
    description = "Terraform Shared Example1"
    rules = [
      {
        name = "rule1"
        action = {
          alert = true
        }
        host           = "any"
        cve            = ["CVE-2017-11882"]
        packet_capture = "extended-capture"
        vendor_id      = ["meta"]
        severity       = ["critical", "high", "medium"]
        category       = "protocol-anomaly"
        threat_name    = "protocol-freak"
      }
    ]
  }
}
file_blocking_profiles = {
  terraform_fb_profile1 = {
    folder      = "Mobile Users"
    description = "Terraform FB Example1"
    rules = [
      {
        name        = "rule1"
        action      = "alert" #["alert", "block", "continue"]
        file_type   = ["tar"] #["any", "dll", "png", "jpeg", "mp3", "docx", "exe", "zip", "tar", "pdf", "flash", "java", "sh", "other"]
        application = ["any"]
        direction   = "both" #["upload", "download", "both"]
      }
    ]
  }
  terraform_shared_fb_profile1 = {
    folder      = "Shared"
    description = "Terraform Shared FB Example1"
    rules = [
      {
        name        = "rule1"
        action      = "alert" #["alert", "block", "continue"]
        file_type   = ["dll"] #["any", "dll", "png", "jpeg", "mp3", "docx", "exe", "zip", "tar", "pdf", "flash", "java", "sh", "other"]
        application = ["any"]
        direction   = "download" #["upload", "download", "both"]
      }
    ]
  }
}

# FB File Types list is not exhaustive


dns_security_profiles = {
  terraform_dnssec_profile1 = {
    folder      = "Mobile Users"
    description = "Terraform DNS Example1"
    botnet_domains = {
      dns_security_categories = [
        {
          action         = "block" # ["allow", "block", "sinkhole", "default"]
          log_level      = "low"   #["informational", "critical", "default", "medium", "high", "low", "none" ]
          name           = "pan-dns-sec-grayware"
          packet_capture = "disable" #["single-packet", "extended-capture", "disable"]
        }
      ]
      lists = [{
        action         = { "block" = true }     # ["allow", "block", "sinkhole", "alert"]
        name           = "default-paloalto-dns" # list must exist
        packet_capture = "single-packet"        #["single-packet", "extended-capture", "disable"]
      }]
      sinkhole = {
        ipv4_address = "pan-sinkhole-default-ip" # ["127.0.0.1", "pan-sinkhole-default-ip"]
        ipv6_address = "::1"
      }
      whitelist = [
        {
          description = "whitelist1"
          name        = "whitelist1"
        }
      ]
    }
  }
}

anti_spyware_profiles = {
  terraform-as-prof1 = {
    description                 = "Terraform AS Example1"
    folder                      = "Shared"
    cloud_inline_analysis       = true
    inline_exception_edl_url    = null
    inline_exception_ip_address = null
    rules = [
      {
        action = {
          reset_server = true
        }
        category       = "command-and-control"
        name           = "zeb-highcrit"
        threat_name    = "Zebrocy"
        packet_capture = "single-packet"
        severity = [
        "high", "critical"]
      },
      {
        action = {
          reset_both = true
        }
        category       = "keylogger"
        name           = "acropolis-any"
        threat_name    = "Acropolis"
        packet_capture = "extended-capture"
        severity = [
        "any"]
      },
      {
        action = {
          reset_client = true
        }
        category       = "fraud"
        name           = "coinhive-med-high-crit"
        threat_name    = "CoinHive"
        packet_capture = "extended-capture"
        severity = [
        "medium", "high", "critical"]
      }
    ]
  },
  terraform-as-prof2 = {
    description                 = "Terraform AS Example2"
    folder                      = "Shared"
    cloud_inline_analysis       = true
    inline_exception_edl_url    = null
    inline_exception_ip_address = null
    rules = [
      {
        action = {
          drop = true
        }
        category       = "any"
        name           = "all-high-crit"
        threat_name    = "Bugs" # This should be optional but it is not
        packet_capture = "single-packet"
        severity = [
        "any"]
      }
    ]
  }
}

wildfire_anti_virus_profiles = {
  terraform-wf-av-prof1 = {
    description = "Terraform WF AV Example1"
    folder      = "Shared"
    rules = [
      {
        name        = "inspect-openai"
        analysis    = "public-cloud" #["public-cloud", "private-cloud"]
        application = ["openai-api"]
        direction   = "both" # ["upload", "download", "both"]
        file_type   = ["script"]
      },
      {
        name        = "fileshare"
        analysis    = "public-cloud" #["public-cloud", "private-cloud"]
        application = ["boxnet-base", "ms-onedrive-base"]
        direction   = "download" # ["upload", "download", "both"]
        file_type   = ["script", "jar", "pe", "apk", "archive"]
      },
      {
        name        = "inspect-social"
        analysis    = "public-cloud" #["public-cloud", "private-cloud"]
        application = ["facebook-base", "hootsuite-base", "linkedin-downloading", "mastodon", "pinterest-base", "twitter-base", "yammer-base"]
        direction   = "both" # ["upload", "download", "both"]
        file_type   = ["any"]
      }
    ]
  },
  terraform-wf-av-prof2 = {
    description = "Terraform WF AV Example2"
    folder      = "Shared"
    rules = [
      {
        name        = "inspect-facebook"
        analysis    = "public-cloud" #["public-cloud", "private-cloud"]
        application = ["facebook-downloading"]
        direction   = "download" # ["upload", "download", "both"]
        file_type   = ["any"]
      }
    ]
    mlav_exception = [
      {
        name        = "skip-fb-file"
        description = "MLAV Exception"
        filename    = "boom.exe"
      }
    ]
  }
}

# DNS Security Categories list is not exhaustive
# ["pan-dns-sec-recent", "pan-dns-sec-grayware", "pan-dns-sec-adtracking",
#"pan-dns-sec-ddns", "pan-dns-sec-parked", "pan-dns-sec-proxy", "pan-dns-sec-phishing",
# "pan-dns-sec-cc", "pan-dns-sec-malware]



profile_groups = {
  terraform_profile_group1 = {
    folder                            = "Mobile Users"
    description                       = "Terraform Example1"
    vulnerability_protection_profiles = ["terraform_vp_profile1"]
    file_blocking_profiles            = ["terraform_fb_profile1"]
  }
  terraform_shared_profile_group1 = {
    folder                            = "Shared"
    description                       = "Terraform Shared Example1"
    vulnerability_protection_profiles = ["terraform_shared_vp_profile1"]
    file_blocking_profiles            = ["terraform_shared_fb_profile1"]
  }
}


#Anti-Spyware Threat Categories
#["dns-proxy","backdoor","data-theft","autogen","spyware","dns-security","downloader",
#"dns-phishing","phishing-kit","cryptominer","hacktool","dns-benign","dns-wildfire","botnet",
#"dns-grayware","inline-cloud-c2","keylogger","p2p-communication","domain-edl","webshell",
#"command-and-control","dns-ddns", "net-worm","any","tls-fingerprint","dns-new-domain",
#"dns","fraud","dns-c2","adware","post-exploitation","dns-malware","browser-hijack","dns-parked"]

#Vulnerability Protection Threat Categories
#["any", brute-force, code-execution, code-obfuscation, command-execution, dos, exploit-kit,
# info-leak, insecure-credentials, overflow, phishing, protocol-anomaly, scan, sql-injection]