output "objects" {
  # Map of all objects created by this module
  value = {
    tags           = try(scm_tag.this, {})
    services       = try(scm_service.this, {})
    service_groups = try(scm_service_group.this, {})
    addresses      = try(scm_address_object.this, {})
    address_groups = try(scm_address_group.this, {})
    schedules      = try(scm_schedule.this, {})
    #    external_dynamic_lists = try(scm_external_dynamic_list.this, {}) Sensitivity causes this to fail, for not I've elected to move it to it's own output
    qos_profiles = try(scm_qos_profile.this, {})
  }
  description = "Map of all Palo Alto Networks Objects created by this module"
}

output "edls" {
  value = {
    external_dynamic_lists = try(scm_external_dynamic_list.this, {})
  }
  sensitive = true # File issue with provider, this should not be required
}

output "policy" {
  value = {
    security_rules   = try(scm_security_rule.this, {})
    qos_policy_rules = try(scm_qos_policy_rule.this, {})
    #    app_override_rules = try(scm_app_override_rule.this, {}) # Bug with string to int64 conversions
    decryption_rules = try(scm_decryption_rule.this, {})
  }
  description = "Map of all Palo Alto Networks Policy Rules created by this module"
}