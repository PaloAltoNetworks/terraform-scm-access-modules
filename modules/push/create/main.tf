locals {
  command = <<EOF
      cd ${path.module}
      cd ..
      python3 ./scripts/push.py --f=${var.folders} --timeout=300
EOF
}

resource "null_resource" "push" {
  triggers = {
    timestamp = var.trigger
    command   = local.command
  }

  provisioner "local-exec" {
    command = self.triggers.command
  }
}
