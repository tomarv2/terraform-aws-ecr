<p align="center">
    <a href="https://github.com/tomarv2/terraform-aws-ecr/actions/workflows/pre-commit.yml" alt="Pre Commit">
        <img src="https://github.com/tomarv2/terraform-aws-ecr/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-aws-ecr" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-ecr/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-ecr" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-ecr/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-aws-ecr" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
    <a href="https://registry.terraform.io/modules/tomarv2/ecr/aws/latest" alt="Terraform registry">
        <img src="https://img.shields.io/badge/Terraform-registry-blue"></a>
</p>

# Terraform module for [AWS Container Registry](https://registry.terraform.io/modules/tomarv2/ecr/aws/latest)

> :arrow_right:  Terraform module for [Azure Container Registry](https://registry.terraform.io/modules/tomarv2/container-registry/azure/latest)

> :arrow_right:  Terraform module for [Google Container Registry](https://registry.terraform.io/modules/tomarv2/container-registry/google/latest)

## Versions

- Module tested for Terraform 1.0.1.
<<<<<<< HEAD
- AWS provider version [3.74](https://registry.terraform.io/providers/hashicorp/aws/latest)
=======
- AWS provider version [3.63](https://registry.terraform.io/providers/hashicorp/aws/latest)
>>>>>>> cfc10b7b3f6fa6ff7e87e870fab484397fcd804c
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-aws-ecr/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-ecr" /></a> in your releases)

**NOTE:**

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project1'
terraform apply -var='teamid=tryme' -var='prjid=project1'
terraform destroy -var='teamid=tryme' -var='prjid=project1'
```
**Note:** With this option please take care of remote state storage

### Option 2:

#### Recommended method (stores remote state in S3 using `prjid` and `teamid` to create directory structure):

- Create python 3.8+ virtual environment
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote --upgrade
```

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_BUCKET_REGION=us-west-2
export TF_AWS_PROFILE=<profile from ~/.ws/credentials>
```

or
<<<<<<< HEAD

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_BUCKET_REGION=us-west-2
export AWS_ACCESS_KEY_ID=<aws_access_key_id>
export AWS_SECRET_ACCESS_KEY=<aws_secret_access_key>
```

=======

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_BUCKET_REGION=us-west-2
export AWS_ACCESS_KEY_ID=<aws_access_key_id>
export AWS_SECRET_ACCESS_KEY=<aws_secret_access_key>
```

>>>>>>> cfc10b7b3f6fa6ff7e87e870fab484397fcd804c
- Updated `examples` directory with required values.

- Run and verify the output before deploying:
```
tf -c=aws plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -c=aws apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -c=aws destroy -var='teamid=foo' -var='prjid=bar'
```

**NOTE:**

- Read more on [tfremote](https://github.com/tomarv2/tfremote)
---

#### ECR with enable/disable flag
```
module "ecr" {
  source = "../"

  deploy_ecr           = true
  image_tag_mutability = "IMMUTABLE"
  deploy_image         = true
  dockerfile_folder    = "../../scripts"
  # NOTE: if "deploy_ecr" is false change "ecr_repository_url" to full repository url
<<<<<<< HEAD
  # ecr_repository_url = module.ecr.ecr_repository_url
=======
  ecr_repository_url = module.ecr.ecr_repository_url
>>>>>>> cfc10b7b3f6fa6ff7e87e870fab484397fcd804c
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

<<<<<<< HEAD
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.74 |
| <a name="requirement_external"></a> [external](#requirement\_external) | 2.2.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.74 |
| <a name="provider_external"></a> [external](#provider\_external) | 2.2.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_kms_alias.kms_key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [null_resource.build_and_push](https://registry.terraform.io/providers/hashicorp/null/3.1.0/docs/resources/resource) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [external_external.build_folder](https://registry.terraform.io/providers/hashicorp/external/2.2.0/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deploy_ecr"></a> [deploy\_ecr](#input\_deploy\_ecr) | Feature flag, true or false | `bool` | `true` | no |
| <a name="input_deploy_image"></a> [deploy\_image](#input\_deploy\_image) | Feature flag, true or false | `bool` | `true` | no |
| <a name="input_dockerfile_folder"></a> [dockerfile\_folder](#input\_dockerfile\_folder) | This is the folder which contains the Dockerfile | `string` | n/a | yes |
| <a name="input_ecr_repository_url"></a> [ecr\_repository\_url](#input\_ecr\_repository\_url) | Full url for the ecr repository | `string` | `null` | no |
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | The encryption type to use for the repository. Valid values are `AES256` or `KMS` | `string` | `"AES256"` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional tags to associate | `map(string)` | `{}` | no |
| <a name="input_image_scanning_configuration"></a> [image\_scanning\_configuration](#input\_image\_scanning\_configuration) | Configuration block that defines image scanning configuration for the repository. By default, image scanning must be manually triggered. See the ECR User Guide for more information about image scanning. | `map(any)` | `{}` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`. | `string` | `"IMMUTABLE"` | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | The ARN of the KMS key to use when encryption\_type is `KMS`. If not specified when encryption\_type is `KMS`, uses a new KMS key. Otherwise, uses the default AWS managed key for ECR. | `string` | `null` | no |
| <a name="input_prjid"></a> [prjid](#input\_prjid) | Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). | `bool` | `true` | no |
| <a name="input_teamid"></a> [teamid](#input\_teamid) | Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Timeouts map. | `map(any)` | `{}` | no |
| <a name="input_timeouts_delete"></a> [timeouts\_delete](#input\_timeouts\_delete) | How long to wait for a repository to be deleted. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_arn"></a> [ecr\_arn](#output\_ecr\_arn) | Full ARN of the repository |
| <a name="output_ecr_name"></a> [ecr\_name](#output\_ecr\_name) | The name of the repository |
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | The URL of the repository (in the form `aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName`) |

=======
>>>>>>> cfc10b7b3f6fa6ff7e87e870fab484397fcd804c
### References
- https://github.com/onnimonni/terraform-ecr-docker-build-module

### Note
- Ensure there are executable permissions on `scripts/build.sh`
