output "groups" {
  value = local.service_connection_group_map
}

output "service_connections" {
  value = scm_service_connection.this
}