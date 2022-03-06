<<<<<<< HEAD
resource "aws_ecr_repository" "default" {
  count = var.deploy_ecr ? 1 : 0

  name                 = "${var.teamid}-${var.prjid}"
  image_tag_mutability = var.image_tag_mutability

  # Encryption configuration
  dynamic "encryption_configuration" {
    for_each = local.encryption_configuration
    content {
      encryption_type = lookup(encryption_configuration.value, "encryption_type")
      kms_key         = lookup(encryption_configuration.value, "kms_key")
    }
  }

  # Image scanning configuration
  dynamic "image_scanning_configuration" {
    for_each = local.image_scanning_configuration
    content {
      scan_on_push = lookup(image_scanning_configuration.value, "scan_on_push")
    }
  }

  # Timeouts
  dynamic "timeouts" {
    for_each = local.timeouts
    content {
      delete = lookup(timeouts.value, "delete")
    }
  }

  tags = merge(local.shared_tags, var.extra_tags)
=======
locals {
  shared_tags = tomap(
    {
      "Name"    = "${var.teamid}-${var.prjid}",
      "team"    = var.teamid,
      "project" = var.prjid
    }
  )
>>>>>>> cfc10b7b3f6fa6ff7e87e870fab484397fcd804c
}
