data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

resource "oci_core_virtual_network" "my_vcn" {
  compartment_id = var.compartment_id
  display_name   = "my_vcn"
  cidr_block     = "10.0.0.0/16"
  dns_label = "myvcn"
}

resource "oci_core_subnet" "my_subnet" {
  compartment_id      = var.compartment_id
  vcn_id              = oci_core_virtual_network.my_vcn.id
  display_name        = "my_subnet"
  cidr_block          = "10.0.1.0/24"
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[min(var.ad_index, length(data.oci_identity_availability_domains.ads.availability_domains) - 1)].name
  dns_label           = "mysubnet"
}
