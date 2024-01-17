locals {
  folder_map = tomap({
    for folder in var.policy_objects_folders :
    folder => {}
  })
}


data "scm_application_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}


data "scm_application_group_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_address_object_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_address_group_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_service_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_service_group_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_schedule_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_external_dynamic_list_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_tag_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_hip_object_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_hip_profile_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}

data "scm_decryption_profile_list" "this" {
  for_each = local.folder_map
  folder   = each.key
}