
resource "null_resource" "trigger" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "echo 'Running before terracurl_request'"
  }
}


resource "terracurl_request" "session" {
  method         = "POST"
  name           = "scm_session"
  response_codes = [200, 201]
  url            = var.auth_url

  headers = {
    Content-Type = "application/x-www-form-urlencoded"
  }

  request_parameters = var.creds

  depends_on = [null_resource.trigger]
}

locals {
  access_token = jsondecode(terracurl_request.session.response)["access_token"]
  #  endpoint_config   = file("${path.module}/endpoints_test.yaml")
  #  config_keys       = keys(yamldecode(local.endpoint_config))
  #  mobile_agent_keys = ["agent-profiles"]
  #  config_values = { for k in local.config_keys :
  #    k => jsondecode(terracurl_request.config[k].response)
  #  }
}

resource "terracurl_request" "config" {
  for_each       = var.get_config
  method         = "GET"
  name           = "list_${each.key}"
  response_codes = [200, 201]
  url            = "${var.sase_api_url}/${each.key}"

  headers = {
    Accept        = "application/json"
    Authorization = "Bearer ${local.access_token}"
  }

  request_parameters = {
    "folder" : try(each.value.folder, var.folder),
    "position" : try(each.value.position, null)
  }
}
