locals {
  command = <<EOF
      cd ${path.module}
      cd ..
      python3 ./scripts/push.py --f=${var.folders} --timeout=300
EOF
}

resource "null_resource" "destroy_push" {
  triggers = {
    command = local.command
  }
  provisioner "local-exec" {
    when    = destroy
    command = self.triggers.command
  }
}