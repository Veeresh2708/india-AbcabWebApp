#!/bin/bash

#site=`http://13.250.122.153:8888/AbcabWebApp/`

#echo "please wait while we are accessing the URL:"
#sleep 10

echo accessing "http://13.250.122.153:8888/AbcabWebApp/"

output=`curl -Is http://13.250.122.153:8888/AbcabWebApp/ | head -n 1 | cut -c 10-12`

echo $output

if [ $output = 200 ]
then
   echo "The application is working fine, proceed with the deployment"
else
   echo "This application is having bug with output code" $output
fi
