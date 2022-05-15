## Introduction
I have created this repository to get started with Terraform and since I don't have much experience with either cloud (AWS, GCP, Azzue etc.) or ACI, I decided to explore the terraform with Cisco IOSXE. Having a network engineer background, I have good understanding how to deal with IOSXE devices. I found two awesome providers mentioned with their links below. 

##### CiscoDevNet/iosxe
https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest

##### netascode/iosxe
https://registry.terraform.io/providers/netascode/iosxe/latest

As there are two different providers, I have seperated them out in two folders, so if you like run the Terraform provider of your choice, go to respective folder and run the terraform commands.

Please also notice that, this is very basic and just to understand how Terraform works and what you can with Terraform to configure IOSXE devices. Everyone is welcome to clone or fork and take this as starting point towards Terraform. 

## Terraform Installation 

Check out the following link to download and install the Terraform on different operating systems. 

https://www.terraform.io/downloads

### Useful Terrafom Command 

``` bash 

Check Terraform Version 
$ terraform version

Verify the installation
$ terraform -help

Install the autocomplete package.
$ terraform -install-autocomplete

Initial and reinstall providers 
$ terraform init
$ terraform init -upgrade
$ terraform providers

Format and validate Terraform config .tf files before plan and apply
$ terraform validate
$ terraform fmt
$ terraform fmt --recursive
$ terraform fmt --diff

Plan (dry run), apply (commit) and destroy (delete/remove)
$ terraform plan
$ terraform apply
$ terraform apply -auto-approve
$ terraform destroy 
$ terraform destroy -auto-approve

Terraform state commands 
$ terraform state list
$ terraform state list iosxe_rest.get_native_config

Display output on the terminal 
$ terraform show
$ terraform output 
$ terraform output -json
$ terraform output debug_native_config

Terraform workspace commands 
$ terraform workspace list 
$ terraform workspace show
$ terraform workspace new dev
$ terraform workspace select default

Plan and Apply on the specific resource 
$ terraform plan -target main.rtf
$ terraform plan -target get_configs.tf (plan with specific file)
$ terraform plan -target iosxe_rest.get_interfaces (plan with specific resource)
$ terraform plan -target iosxe_rest

$ terraform apply -target main.rtf
$ terraform apply -target get_configs.tf (apply with specific file)
$ terraform apply -target iosxe_rest.get_interfaces (apply with specific resource)
$ terraform apply -target=module.<module_name> (apply with specific module)

Replace the providers from 'netascode/iosxe' to 'CiscoDevNet/iosxe'
$ terraform state replace-provider netascode/iosxe CiscoDevNet/iosxe 

Terraform Resource Graph
$ terraform graph | dot -Tpng > terra-graph.png

Teraform commands running with variables
$ terraform apply -var="image_id=ami-abc123"
terraform apply -var='image_id_list=["ami-abc123","ami-def456"]' -var="instance_type=t2.micro"

$ terraform apply -var-file="testing.tfvars"
$ terraform apply -var-file="terraform.tfvars.json"

$ TF_VAR_hostname='csr1000v-1' terraform plan
$ TF_VAR_hostname='csr1000v-1' terraform apply -auto-approve


Terraform command provides an interactive console
terraform console 
```

## Author 
__[Muhammad Rafi](https://www.linkedin.com/in/muhammad-rafi-0a37a248/)__


