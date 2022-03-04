output "ecr_arn" {
  description = "Full ARN of the repository"
  value       = module.ecr.ecr_arn
}

output "ecr_name" {
  description = "The name of the repository."
  value       = module.ecr.ecr_name
}

output "ecr_repository_url" {
  description = "The URL of the repository (in the form `aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName`)"
  value       = module.ecr.ecr_repository_url
}

#data.external.build_folder.program
output "external_build_program" {
  value = module.ecr.external_build_program
}
