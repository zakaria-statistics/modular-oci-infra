variable "compartment_id" {
  description = "The OCID of the compartment."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be deployed."
  type        = string
}

variable "ad_index" {
  description = "Index of the availability domain for compute."
  type        = number
}


