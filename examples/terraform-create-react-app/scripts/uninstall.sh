#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $SCRIPT_DIR/../infrastructure/local
terraform destroy --auto-approve
rm -rf .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
