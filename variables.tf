variable "tenancy_ocid" {
  description = "The OCID of the tenancy."
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user."
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint for the user's API key."
  type        = string
}

variable "private_key_path" {
  description = "The path to the private key file."
  type        = string
}

variable "region" {
  description = "The region to create resources."
  type        = string
}

variable "compartment_id" {
  description = "The OCID of the compartment."
  type        = string
}


variable "ad_index" {
  description = "Index of the availability domain to use."
  type        = number
  default     = 0  # Default value for the ad_index
}

