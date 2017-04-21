#!/bin/bash
Read -p "Enter Elasticsearch url" url
#How many days do you want to keep the logs
Read -p "Enter the offset date" dateOffset
# AWS Lambda normally names the index as cwl-17.04.20
index=cwl-$(date --date="$dateOffset day ago" +%Y.%m.%d)
curl -XDELETE $url/$index"
