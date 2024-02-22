
variable "env_name" {
  type        = string
  description = "VPC  name"
}

variable "subnets" {
  type       = list(object({zone = string, cidr = string}))
  default    = []
}
