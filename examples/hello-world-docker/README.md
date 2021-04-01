# Hello World Docker inside Terraform

This example is a hello world of how to setup a local environment
with Terraform and docker!

## Benefits

* No need for `docker-compose.yml` files
* Easy setup for complex environments

## Requirements

* Terraform
* Docker

## Getting Started

Run the infrastructure:

```
terraform init
terraform apply
```

Open in the browser:

http://localhost:10123

## Uninstall

Use this to uninstall this infrastructure completely from your system!

```
terraform destroy
```

### Trash after uninstall

This files were created after running `terraform init && terraform apply`
and they are not useful. You can safely delete this files. 

```
.terraform/
.terraform.lock.hcl
terraform.tfstate
terraform.tfstate.backup
```

> OPTIONAL NOTE:
> 
> Terraform has created a lock file .terraform.lock.hcl to record the provider
> selections it made above. Include this file in your version control repository
> so that Terraform can guarantee to make the same selections by default when
> you run "terraform init" in the future.

