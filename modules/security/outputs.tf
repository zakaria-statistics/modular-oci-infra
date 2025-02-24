output "security_list_id" {
  description = "The ID of the created security list."
  value       = oci_core_security_list.my_security_list.id
}
