#!/bin/bash
echo "Find out the latest Amazon Linux ami id"

read -p "Region Name : " REGION
name=$(aws --region $REGION ec2 describe-images --owners 137112412989\
 --filters Name=root-device-type,Values=ebs\
  Name=architecture,Values=x86_64 Name=name,Values="amzn-ami-hvm*" |\
   awk -F ': ' '/"Name"/ { print $2 | "sort" }' | tr -d '",' | grep -v rc |tail -1)

ami_id=$(\
    aws --region $REGION ec2 describe-images --owners 137112412989 \
        --filters Name=name,Values="$name" \
    | awk -F ': ' '/"ImageId"/ { print $2 }' | tr -d '",')

echo $ami_id
