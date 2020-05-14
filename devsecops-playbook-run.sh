#!/usr/bin/env bash

export AWS_ACCESS_KEY_ID=AKIAXLNVSB3NNGVRL3R2
export AWS_SECRET_ACCESS_KEY=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

: ${AWS_ACCESS_KEY_ID?"Need to set AWS_ACCESS_KEY_ID"}
: ${AWS_SECRET_ACCESS_KEY?"Need to set AWS_SECRET_ACCESS_KEY"}

export ANSIBLE_HOST_KEY_CHECKING=False

#time ansible-playbook devsecops-playbook.yml "$@"
ansible-playbook devsecops-playbook.yml "$@" 
