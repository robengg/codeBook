#!/bin/sh
#This is Explain how use proxy script with cURL
#In Jenkins situation this script can send build request remotely
######################################################################################
#HTTP PROXY
http_proxy_ipv6=http://192.168.1.1:8000/

JOB_URL=https://[5555:cf8:0:677::er34:23]/job/package_trans_to_box_test/build

JENKINS_API_TOKEN="12345678987654321"

curl -x $http_proxy_ipv6 -f -g -k -d POST ${JOB_URL} --user 4444444:${JENKINS_API_TOKEN} 
--data-urlencode 'json={"parameter": [{"name":"SRC_PATH", "value":"SRC_PATH"}'


echo "####[END OPERATION]####"
read
####################################################################################
