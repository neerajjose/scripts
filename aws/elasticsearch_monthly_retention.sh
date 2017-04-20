#!/bin/bash
Read -p "Enter Elasticsearch url" url

index=cwl-$(date --date="30 day ago" +%Y.%m.%d)
curl -XDELETE $url/$index"
