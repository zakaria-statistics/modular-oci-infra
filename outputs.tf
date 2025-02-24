output "vcn_id" {
  value = module.networking.vcn_id
}

output "instance_id" {
  value = module.compute.instance_id
}

output "available_ad_count" {
  value = length(data.oci_identity_availability_domains.ads.availability_domains)
}
