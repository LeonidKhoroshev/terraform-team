variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "accessibility zone ru-cantral1 -a,-b,-c or-d"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "prefix-based standard for representing IP addresses"
}

variable "env_name" {
  type        = string
  description = "VPC  name"
}

###variable for exercise 4

variable "subnets" {
  type       = list(object({zone = string, cidr = string}))
  default    = []
}
