###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
#variable "default_cidr" {
#  type        = list
#  default     = ["10.0.1.0/24"]
#  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
#}

#variable "vpc_name" {
#  type        = string
#  default     = "develop"
#  description = "VPC network&subnet name"
#}

###common vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "your_ssh_ed25519_key"
#  description = "ssh-keygen -t ed25519"
#}

###example vm_web var
#variable "vm_web_name" {
#  type        = string
#  default     = "netology-develop-platform-web"
#  description = "example vm_web_ prefix"
#}

###example vm_db var
#variable "vm_db_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#  description = "example vm_db_ prefix"
#}

###vars for exercise 1

variable "vm_count" {
  type        = number
  default     = "1"
}

variable "vm_name" {
  type        = string
  default     = "web"
}

variable "env_name" {
  type        = string
  default     = "develop"
}

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "public_ip" {
  type        = bool
  default     = "true"
}

variable "ssh_public_key" {
  type        = list(string)
  default     = ["~/.ssh/id_rsa.pub"]
}

###variables for exercise 4

variable "subnets" {
  type        = list(object({zone = string, cidr = string}))
  default     = [{ zone = "ru-central1-a", cidr = "10.0.1.0/24" },
                 { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
                 { zone = "ru-central1-c", cidr = "10.0.3.0/24" }
                ]
}

###variables for exercise 5

variable "ip_address" {
  type        = string
  description = "ip address"
  default     = "1920.1680.0.1"
  validation {
    condition = can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.ip_address))
    error_message = "ip address is incorrect"
  }
}

variable "ip_list" {
  type        = list(string)
  description = "list of ip addresses"
  default     = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]
  validation {
    condition = alltrue([
      for a in var.ip_list: can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", a))
    ])
    error_message = "list of ip addresses is incorrect"
  }
}
