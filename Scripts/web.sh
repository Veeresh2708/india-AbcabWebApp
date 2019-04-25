#!/bin/bash

site="http://ec2-54-255-186-19.ap-southeast-1.compute.amazonaws.com:8888/AbcabWebApp/"

echo "please wait while we are accessing the URL: $site"
sleep 10

output=`curl -Is $site | head -n 1 | cut -c 10-12`

if [ $output = 200 ]
then
   echo "The application is working fine with the status code $output, proceed with the deployment"
else
   echo "This application is having bug with output code: $output"
fi
