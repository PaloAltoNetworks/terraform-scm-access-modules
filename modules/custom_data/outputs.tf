output "custom_data" {
  value = { for k, v in terracurl_request.config : k => v.response }
}