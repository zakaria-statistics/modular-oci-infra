#!/bin/bash

n=0
max_attempts=10080  # Retry up to 7 days
ad_index=0
num_ads=3  # Adjust based on your region (usually 3 ADs)

while [ "$n" -lt "$max_attempts" ]; do
    echo "Attempt $n: Trying with AD index $ad_index"

    # Update the Terraform variable file with the new AD index
    sed -i "s/^ad_index = .*/ad_index = $ad_index/" terraform.tfvars

    # Initialize Terraform (only needed once, but safe to re-run)
    terraform init

    # Run Terraform apply
    terraform apply -auto-approve && break

    # Rotate to the next AD
    ad_index=$(( (ad_index + 1) % num_ads ))

    n=$((n+1))
    echo "Retry Attempt — $n, rotating AD to index $ad_index"
    sleep 60
done
