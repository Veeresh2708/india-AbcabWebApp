#!/bin/bash

echo "Enter the URL:"
read site

echo "please wait while we are accessing the URL:"
sleep 10

echo accessing $site

output=`curl -Is $site | head -n 1 | cut -c 10-12`

echo $output

if [ $output = 200 ]
then
   echo "The application is working fine, proceed with the deployment"
else
   echo "This application is having bug with output code" $output
fi
