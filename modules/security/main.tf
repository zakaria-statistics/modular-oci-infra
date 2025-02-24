resource "oci_core_security_list" "my_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "allow_traffic"

  dynamic "ingress_security_rules" {
    for_each = var.allowed_ports
    content {
      protocol = "6" # TCP
      source   = "0.0.0.0/0"

      tcp_options {
        min = ingress_security_rules.value
        max = ingress_security_rules.value
      }
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}
