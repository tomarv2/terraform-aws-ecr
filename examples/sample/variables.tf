variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}
<<<<<<< HEAD

variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-west-2"
  type        = string
}
=======
>>>>>>> cfc10b7b3f6fa6ff7e87e870fab484397fcd804c
