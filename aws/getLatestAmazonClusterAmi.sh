#!/bin/bash
echo "Find out the latest Amazon Cluster Linux ami id"

read -p "Region Name : " REGION
name=$(aws --region $1 ec2 describe-images --owners 591542846629|\
   awk -F ': ' '/"Name"/ { print $2 | "sort" }' | tr -d '",' | grep -v rc |tail -1)

ami_id=$(\
    aws --region $1 ec2 describe-images --owners 591542846629 \
        --filters Name=name,Values="$name" \
    | awk -F ': ' '/"ImageId"/ { print $2 }' | tr -d '",')

echo $ami_id
