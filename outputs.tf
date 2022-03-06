output "ecr_arn" {
  description = "Full ARN of the repository"
  value       = join(" ", aws_ecr_repository.default.*.arn)
}

output "ecr_name" {
  description = "The name of the repository"
  value       = join(" ", aws_ecr_repository.default.*.name)
}

output "ecr_repository_url" {
  description = "The URL of the repository (in the form `aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName`)"
  value       = join(" ", aws_ecr_repository.default.*.repository_url)
}
