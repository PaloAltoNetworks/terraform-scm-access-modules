output "security_profiles" {
  # Map of all security profiles
  value = {
    anti_spyware_profiles  = try(scm_anti_spyware_profile.this, {})
    file_blocking_profiles = try(scm_file_blocking_profile.this, {})
    dns_security_profiles  = try(scm_dns_security_profile.this, {})
    #url_filtering_profiles        = try(scm_url_filtering_profiles.this, {})
    vulnerability_protection_profiles = try(scm_vulnerability_protection_profile.this, {})
    wildfire_anti_virus_profiles      = try(scm_wildfire_anti_virus_profile.this, {})
  }
  description = "Map of all Palo Alto Networks security profiles"
  sensitive   = false
}

output "profile_groups" {
  # Map of all profile groups
  value       = try(scm_profile_group.this, {})
  description = "Map of all Palo Alto Networks profile groups"
  sensitive   = false
}