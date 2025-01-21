# terraform-oci-arch-shared-volume

## Project description

In this repository, we make use of Terraform code to deploy an OCI Block Volume with Oracle Cluster File System (OCFS2), shared between two OCI Compute instances. This set of Terraform files whioch can customized according to any requirements.   

## Deploy Using the Terraform CLI

### Clone the Module

Now, you'll want a local copy of this repo. You can make that with the commands:

```
  git clone https://github.com/oracle-devrel/terraform-oci-arch-shared-volume.git
  cd terraform-oci-arch-shared-volume
  ls
```

### Prerequisites
First off, you'll need to do some pre-deploy setup.  That's all detailed [here](https://github.com/cloud-partners/oci-prerequisites).

Create a `terraform.tfvars` file, and specify the following variables:

```
# Authentication
tenancy_ocid         = "<tenancy_ocid>"
user_ocid            = "<user_ocid>"
fingerprint          = "<fingerprint>"
private_key_path     = "<pem_private_key_path>"

private_key_oci      = "~/.ssh/id_rsa"
public_key_oci       = "~/.ssh/id_rsa.pub"

# Region
region = "<oci_region>"

# Compartment
compartment_ocid = "<compartment_ocid>"

# Availability Domain (optional)
availability_domain_name = "<availability_domain_name>"
```
 

### Create the Resources
Run the following commands:

```
  terraform init
  terraform plan
  terraform apply
```

### Testing your Deployment

A simple way to test this implementation is the following:

1. Connect via SSH to both instances

2. Verify you can access /ocfs2

3. Create a file in /ocfs2. You will then be able to confirm this file is accessible from both instances. 


### Destroy the Deployment
When you no longer need the deployment, you can run this command to destroy the resources:

    terraform destroy

## Contributing

This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## Attribution & Credits
This Terraform code is adapted from a repository by Lukasz Feldman (https://github.com/lfeldman), who we would like to thank.

## License
Copyright (c) 2024 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE.txt) for more details.