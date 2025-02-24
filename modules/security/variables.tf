variable "compartment_id" {
  description = "The OCID of the compartment."
  type        = string
}

variable "vcn_id" {
  description = "The ID of the Virtual Cloud Network."
  type        = string
}

variable "allowed_ports" {
  description = "List of allowed TCP ports for ingress traffic."
  type        = list(number)
  default     = [22, 80, 443]  # Default allows SSH, HTTP, and HTTPS
}
