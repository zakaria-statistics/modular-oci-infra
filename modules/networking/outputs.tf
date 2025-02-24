output "vcn_id" {
  value = oci_core_virtual_network.my_vcn.id
}

output "subnet_id" {
  value = oci_core_subnet.my_subnet.id
}
