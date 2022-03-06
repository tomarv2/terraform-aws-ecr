data "aws_region" "current" {}

data "external" "build_folder" {
  program = ["sh", "${path.module}/scripts/folder_contents.sh", var.dockerfile_folder]
}

# Push to aws_ecr_repository
resource "null_resource" "build_and_push" {
  count = var.deploy_image ? 1 : 0

  triggers = {
    build_folder_content_md5 = data.external.build_folder.result.md5
  }

  # refer scripts/build.sh for more details
  provisioner "local-exec" {
    command = "${path.module}/scripts/build.sh ${var.dockerfile_folder} ${local.url} ${var.image_tag_mutability} ${data.aws_region.current.name}"
  }

}
