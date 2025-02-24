module "networking" {
  source         = "./modules/networking"
  compartment_id = var.compartment_id
  ad_index = var.ad_index
}

module "compute" {
  source         = "./modules/compute"
  compartment_id = var.compartment_id
  subnet_id      = module.networking.subnet_id
  ad_index = var.ad_index
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}