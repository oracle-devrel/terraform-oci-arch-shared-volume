## Copyright © 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
variable "private_key_oci" {}
variable "public_key_oci" {}

variable "release" {
  default = "1.0"
}

variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "VCNname" {
  default = "VCN"
}

variable "webservice_ports" {
  default = [80,443]
}

variable "bastion_ports" {
  default = [22]
}

variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "node_shape" {
description = "Instance shape to use for master instance. "
 default     = "VM.Standard.E4.Flex"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "9"
}

variable "availability_domain_name" {
  default = ""
}

variable "shape_flex_ocpus" {
  default = 1
}

variable "shape_flex_memory" {
  default = 10
}