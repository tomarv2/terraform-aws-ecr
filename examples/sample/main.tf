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
}

module "ecr" {
  source = "../../"

  deploy_ecr           = true
  image_tag_mutability = "MUTABLE"
  deploy_image         = true
  dockerfile_folder    = "docker_folder"
  # NOTE: if "deploy_ecr" is false change "ecr_repository_url" to full repository url
  #ecr_repository_url = module.ecr.ecr_repository_url
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
