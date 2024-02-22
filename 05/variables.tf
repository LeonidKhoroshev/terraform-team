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
variable "default_cidr" {
  type        = list
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


###vpc vars

variable "env_name" {
  type        = string
  default     = "db"
}

variable "subnets" {
  type        = list(object({zone = string, cidr = string}))
  default     = [{ zone = "ru-central1-a", cidr = "10.0.1.0/24" },
                 { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
                 { zone = "ru-central1-c", cidr = "10.0.3.0/24" }
                ]
}

