data "aws_region" "current" {}

locals {

  # Encryption configuration
  # If encryption type as KMS, use assigned KMS key or otherwise build a new key
  encryption_configuration = var.encryption_type != "KMS" ? [] : [
    {
      encryption_type = "KMS"
      kms_key         = var.encryption_type == "KMS" && var.kms_key == null ? aws_kms_key.kms_key[0].arn : var.kms_key
    }
  ]

  # Image scanning configuration
  # If no image_scanning_configuration block is provided, build one using the default values
  image_scanning_configuration = [
    {
      scan_on_push = lookup(var.image_scanning_configuration, "scan_on_push", null) == null ? var.scan_on_push : lookup(var.image_scanning_configuration, "scan_on_push")
    }
  ]

  # Timeouts
  # If no timeouts block is provided, build one using the default values
  timeouts = var.timeouts_delete == null && length(var.timeouts) == 0 ? [] : [
    {
      delete = lookup(var.timeouts, "delete", null) == null ? var.timeouts_delete : lookup(var.timeouts, "delete")
    }
  ]
}
