## Copyright © 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_core_instance" "Webserver1" {
  availability_domain = var.availability_domain_name == "" ? lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name") : var.availability_domain_name
  compartment_id = var.compartment_ocid
  display_name = "WebServer1"
  shape = var.node_shape
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.InstanceImageOCID.images[0], "id")
  }
  metadata = {
      ssh_authorized_keys = file(var.public_key_oci)
      user_data = base64encode(file("./scripts/bootstrap"))
  }
  create_vnic_details {
     subnet_id = oci_core_subnet.WebSubnet.id
     assign_public_ip = true
  }
}

data "oci_core_vnic_attachments" "Webserver1_VNIC1_attach" {
  availability_domain = var.availability_domain_name == "" ? lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name") : var.availability_domain_name
  compartment_id = var.compartment_ocid
  instance_id = oci_core_instance.Webserver1.id
}

data "oci_core_vnic" "Webserver1_VNIC1" {
  vnic_id = data.oci_core_vnic_attachments.Webserver1_VNIC1_attach.vnic_attachments.0.vnic_id
}

output "Webserver1_PublicIP" {
   value = [data.oci_core_vnic.Webserver1_VNIC1.public_ip_address]
}

