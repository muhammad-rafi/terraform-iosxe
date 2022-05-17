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

```bash  

# Check Terraform Version 
$ terraform version

# Verify the installation and terraform commands help
$ terraform -help

# Install the autocomplete package.
$ terraform -install-autocomplete

# Initial and reinstall providers 
$ terraform init
$ terraform init -upgrade
$ terraform providers

# Format and validate Terraform config .tf files before plan and apply
$ terraform validate
$ terraform fmt
$ terraform fmt --diff

# Plan (dry run), apply (commit) and destroy (delete/remove)
$ terraform plan
$ terraform apply
$ terraform apply -auto-approve
$ terraform destroy 
$ terraform destroy -auto-approve

# Refresh the terraform state file, if there was a manual change on the device
$ terraform refresh

# Terraform state commands 
$ terraform state list
$ terraform state list iosxe_rest.get_native_config

# Display output on the terminal 
$ terraform show
$ terraform output 
$ terraform output -json
$ terraform output debug_native_config

# Terraform workspace commands 
$ terraform workspace list 
$ terraform workspace show
$ terraform workspace new dev
$ terraform workspace select default

# Plan and Apply on the specific resource 
$ terraform plan -target main.rtf
$ terraform plan -target get_configs.tf (plan with specific .tf file)
$ terraform plan -target iosxe_rest.get_interfaces (plan with specific resource)
$ terraform plan -target iosxe_rest

$ terraform apply -target main.rtf
$ terraform apply -target get_configs.tf (apply with specific .tf file)
$ terraform apply -target iosxe_rest.get_interfaces (apply with specific resource)
$ terraform apply -target=module.bgp_config (apply with specific module)

# Import the existing user from the device (note: resource "iosxe_static_route.static_route" must exists otherwise won't import )
$ terraform import iosxe_static_route.static_route "Cisco-IOS-XE-native:native/ip/route/ip-route-interface-forwarding-list=10.20.0.0,255.255.255.0"

# Replace the providers from 'netascode/iosxe' to 'CiscoDevNet/iosxe'
$ terraform state replace-provider netascode/iosxe CiscoDevNet/iosxe 

# Generate a Terraform Resource Graph
$ terraform graph | dot -Tpng > terra-iosxe-graph.png
$ terraform graph | dot -Tsvg > terra-iosxe-graph.svg

# Terraform commands running with CLI variables
$ terraform plan -var="hostname=csr1000v-2"
$ terraform apply -var="hostname=csr1000v-2"
$ terraform apply -var='vrfs=["VRF_A","VRF_B"]'

# Terraform commands running with variables files
$ terraform plan -var-file="dev.tfvars"
$ terraform apply -var-file="dev.tfvars"
$ terraform apply -var-file="terraform.tfvars.json"

# Terraform commands running with environment variables
$ TF_VAR_hostname='csr1000v-1' terraform plan
$ TF_VAR_hostname='csr1000v-1' terraform apply -auto-approve

# Generate JSON format of terraform.tfvars of inputs
$ terraform-docs tfvars json .

# Terraform command provides an interactive console
terraform console 
```

### Variable Types in Terraform

The Terraform language uses the following types for its values:

* **string:** a sequence of Unicode characters representing some text, like "hello".
* **number**: a numeric value. The number type can represent both whole numbers like 15 and fractional values like 6.283185.
* **bool***: a boolean value, either true or false. bool values can be used in conditional logic.
* **list (or tuple)**: a sequence of values, like ["us-west-1a", "us-west-1c"]. Elements in a list or tuple are identified by consecutive whole numbers, starting with zero.
* **map (or object)**: a group of values identified by named labels, like {name = "Mabel", age = 52}.

*Reference: https://www.terraform.io/language/expressions/types*

### Input Variables Precedence in Terraform
Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

* Environment variables
* The terraform.tfvars file, if present.
* The terraform.tfvars.json file, if present.
* Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
* Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

*Reference: https://www.terraform.io/language/values/variables*

### Loops in Terraform

* **for** expression creates a complex type value by transforming another complex type value. Each element in the input value can correspond to either one or zero values in the result, and an arbitrary expression can be used to transform each input element into an output element.

*Reference: https://www.terraform.io/language/expressions/for*

* **for_each** meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set. Each instance has a distinct infrastructure object associated with it, and each is separately created, updated, or destroyed when the configuration is applied.

*Reference: https://www.terraform.io/language/meta-arguments/for_each*

* **count** is a meta-argument defined by the Terraform language. It can be used with modules and with every resource type.

*Reference: https://www.terraform.io/language/meta-arguments/count*

Checkout my `loopback_interfaces.tf` and `vrf.tf` inside nac_iosxe folder where I have used these loops.  

### Modules in Terraform

A module is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

*Reference: https://www.terraform.io/language/modules/develop*

Checkout the modules in `modules` directory, I have created inside nac_iosxe folder, I have only created two BGP modules for testing as this is only a basic repository, you may create more. 

## Author 
__[Muhammad Rafi](https://www.linkedin.com/in/muhammad-rafi-0a37a248/)__


