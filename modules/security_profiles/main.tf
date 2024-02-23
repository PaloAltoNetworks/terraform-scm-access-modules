resource "scm_anti_spyware_profile" "this" {
  for_each                         = try(var.anti_spyware_profiles, {})
  folder                           = each.value.folder
  name                             = each.key
  description                      = try(each.value.description, null)
  rules                            = try(each.value.rules, null)
  threat_exceptions                = try(each.value.threat_exception, null)
  cloud_inline_analysis            = try(each.value.cloud_inline_analysis, false)
  inline_exception_edl_urls        = try(each.value.inline_exception_edl_url, null)
  inline_exception_ip_addresses    = try(each.value.inline_exception_ip_address, null)
  mica_engine_spyware_enabled_list = try(each.value.mica_engine_spyware_enabled, null)
  snippet                          = try(each.value.snippet, null)
}

resource "scm_file_blocking_profile" "this" {
  for_each    = try(var.file_blocking_profiles, {})
  folder      = each.value.folder
  snippet     = try(each.value.snippet, null)
  name        = each.key
  description = try(each.value.description, null)
  rules       = try(each.value.rules, null)
}

resource "scm_dns_security_profile" "this" {
  for_each       = try(var.dns_security_profiles, {})
  folder         = each.value.folder
  snippet        = try(each.value.snippet, null)
  name           = each.key
  botnet_domains = try(each.value.botnet_domains, null)
  description    = try(each.value.description, null)
}

#resource "scm_url_filtering_profiles" "this" {
#  for_each = try(var.url_filtering_profiles, {})
#  folder   = each.value.folder
#  snippet  = try(each.value.snippet, null)
#  name     = each.key
#}

resource "scm_vulnerability_protection_profile" "this" {
  for_each          = try(var.vulnerability_protection_profiles, {})
  folder            = each.value.folder
  snippet           = try(each.value.snippet, null)
  name              = each.key
  description       = try(each.value.description, [])
  threat_exceptions = try(each.value.threat_exception, null)
  rules             = try(each.value.rules, null)
}

resource "scm_wildfire_anti_virus_profile" "this" {
  for_each          = try(var.wildfire_anti_virus_profiles, {})
  folder            = each.value.folder
  snippet           = try(each.value.snippet, null)
  name              = each.key
  description       = try(each.value.description, null)
  rules             = try(each.value.rules, null)
  packet_capture    = try(each.value.packet_capture, false)
  threat_exceptions = try(each.value.threat_exception, null)
  mlav_exceptions   = try(each.value.mlav_exception, null)
}

resource "scm_profile_group" "this" {
  for_each        = try(var.profile_groups, {})
  folder          = each.value.folder
  snippet         = try(each.value.snippet, null)
  name            = each.key
  saas_securities = try(each.value.saas_security_profiles, null)
  spywares        = try(each.value.anti_spyware_profiles, null)
  file_blockings  = try(each.value.file_blocking_profiles, null)
  dns_securities  = try(each.value.dns_security_profiles, null)
  #url_filtering_profiles = each.value.url_filtering_profiles
  vulnerabilities             = try(each.value.vulnerability_protection_profiles, null)
  virus_and_wildfire_analyses = try(each.value.wildfire_anti_virus_profiles, null)
  depends_on = [
    scm_anti_spyware_profile.this,
    scm_file_blocking_profile.this,
    scm_dns_security_profile.this,
    #scm_url_filtering_profiles.this,
    scm_vulnerability_protection_profile.this,
    scm_wildfire_anti_virus_profile.this
  ]
}
