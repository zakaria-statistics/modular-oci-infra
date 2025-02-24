data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

data "oci_core_images" "ubuntu" {
  compartment_id = var.compartment_id
  operating_system = "Canonical Ubuntu"
  operating_system_version = "22.04"
}

resource "oci_core_instance" "my_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[min(var.ad_index, length(data.oci_identity_availability_domains.ads.availability_domains) - 1)].name
  compartment_id      = var.compartment_id
  display_name        = "my_instance"
  shape               = "VM.Standard.A1.Flex"

  create_vnic_details {
    subnet_id       = var.subnet_id
    assign_public_ip = true
  }

  source_details {
    source_type     = "image"
    source_id       = data.oci_core_images.ubuntu.images[0].id
    boot_volume_size_in_gbs = 50
  }

  shape_config {
    ocpus         = 4
    memory_in_gbs = 24
  }
}
