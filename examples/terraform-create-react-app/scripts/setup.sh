#!/bin/bash
cd $PWD/../infrastructure/local
terraform init
terraform apply --auto-approve
