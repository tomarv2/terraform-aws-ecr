module "ecr" {
  source = "../../"

  deploy_ecr           = true
  image_tag_mutability = "IMMUTABLE"
  deploy_image         = true
  dockerfile_folder    = "../../scripts"
  # NOTE: if "deploy_ecr" is false change "ecr_repository_url" to full repository url
  ecr_repository_url = module.ecr.ecr_repository_url
  email              = "demo@demo.com"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}