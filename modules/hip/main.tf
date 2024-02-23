resource "scm_hip_object" "this" {
  for_each             = try(var.objects, {})
  folder               = try(each.value.folder, null) # Fail if no folder
  name                 = each.key
  description          = try(each.value.description, null)
  anti_malware         = try(each.value.anti_malware, null)
  certificate          = try(each.value.certificate, null)
  custom_checks        = try(each.value.custom_checks, null)
  data_loss_prevention = try(each.value.data_loss_prevention, null)
  disk_backup          = try(each.value.disk_backup, null)
  disk_encryption      = try(each.value.disk_encryption, null)
  firewall             = try(each.value.firewall, null)
  host_info            = try(each.value.host_info, null)
  mobile_device        = try(each.value.mobile_device, null)
  network_info         = try(each.value.network_info, null)
  patch_management     = try(each.value.patch_management, null)
  device               = try(each.value.device, null)
  snippet              = try(each.value.snippet, null)
}

resource "scm_hip_profile" "this" {
  for_each    = try(var.profiles, {})
  folder      = try(each.value.folder, null) # Fail if no folder
  name        = each.key                     # Fail if no name
  description = try(each.value.description, null)
  match       = try(each.value.match, null) # Fail if no match
  depends_on = [
    scm_hip_object.this
  ]
}
