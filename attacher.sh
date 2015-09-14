#!/bin/sh

coded=`cat TestPDF.pdf | perl -MMIME::Base64 -ne 'print encode_base64($_)'`
json="{\"file\":\"${coded}\"}"
echo "$json" > json.file
curl -X POST "192.168.0.37:9200/test/attachment/" -d @json.file