<<<<<<< HEAD:examples/sample/main.tf
terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 3.74"
    }
  }
}

provider "aws" {
  region = var.region
=======
provider "aws" {
  profile = "default"
>>>>>>> cfc10b7b3f6fa6ff7e87e870fab484397fcd804c:examples/ecr/main.tf
}

module "ecr" {
  source = "../../"

  deploy_ecr           = true
  image_tag_mutability = "MUTABLE"
  deploy_image         = true
  dockerfile_folder    = "docker_folder"
  # NOTE: if "deploy_ecr" is false change "ecr_repository_url" to full repository url
<<<<<<< HEAD:examples/sample/main.tf
  #ecr_repository_url = module.ecr.ecr_repository_url
=======
  ecr_repository_url = module.ecr.ecr_repository_url
>>>>>>> cfc10b7b3f6fa6ff7e87e870fab484397fcd804c:examples/ecr/main.tf
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
