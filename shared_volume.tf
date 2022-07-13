## Copyright © 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_core_volume" "WebserverBlockVolume100G" {
  availability_domain = var.availability_domain_name == "" ? lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name") : var.availability_domain_name
  compartment_id = var.compartment_ocid
  display_name = "Webserver BlockVolume 100G"
  size_in_gbs = "100"
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

resource "oci_core_volume_attachment" "Webserver1BlockVolume100G_attach" {
    attachment_type = "iscsi"
    instance_id = oci_core_instance.Webserver1.id
    volume_id = oci_core_volume.WebserverBlockVolume100G.id
    is_shareable = true
}

resource "oci_core_volume_attachment" "Webserver2BlockVolume100G_attach" {
    attachment_type = "iscsi"
    instance_id = oci_core_instance.Webserver2.id
    volume_id = oci_core_volume.WebserverBlockVolume100G.id
    is_shareable = true
}