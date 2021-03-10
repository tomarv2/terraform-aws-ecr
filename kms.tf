# KMS key
resource "aws_kms_key" "kms_key" {
  count       = var.encryption_type == "KMS" && var.kms_key == null ? 1 : 0
  description = "${var.teamid}-${var.teamid} KMS key"
}

resource "aws_kms_alias" "kms_key_alias" {
  count         = var.encryption_type == "KMS" && var.kms_key == null ? 1 : 0
  name          = "alias/${var.teamid}-${var.teamid} Key"
  target_key_id = aws_kms_key.kms_key[0].key_id
}
