#!/bin/sh -x
####################################################################################################################
#This Job is Allowing for get Jenkins server status 
#Wheather it is Down or Up, Before using this Have some dependency
#Must Have Jenkins Description setter Plugin for show table on status page
#Jenkins username and token, for proxy if dont required just remove it 
#[Regular expression]=【DESCRIPTION】 (.*) and Description "\1"
#If you wish to use it your own way go ahead, it just a good Example which was really hard to find over internet
####################################################################################################################
###if you have proxy
http_proxy_ipv6=http://177.222.111.8787:80880/ 

###Convert String Parameters to and Array
TARGET_JOBS=($SERVER_URL)

###Create Loop for multiple job link
for (( l = 0; l < ${#TARGET_JOBS[@]}; l++))
do 
curl --retry 3 --retry-delay 3 -x $http_proxy_ipv6 -s -D status.txt -o /dev/null -g -k -X GET ${TARGET_JOBS[l]} --user userName:${JENKINS_API_TOKEN}

###From HTTP response Status get response
httpStatus=`cat status.txt | head -n1 | cut -d" " -f2`

###Check if the Response Match to success which is "200"
if [ "$httpStatus" == "200" ]; then
     echo '<tr><td>'${TARGET_JOBS[l]}'</td><td>UP</td><td>'$httpStatus'</td></tr>'>> data.txt 
else
     echo '<tr><td>'${TARGET_JOBS[l]}'</td><td>DOWN</td><td>'$httpStatus'</td></tr>'>> data.txt 
fi
done

###Construction for jenkins Description Setter
STATUS=`cat data.txt`
echo '【DESCRIPTION】 <style type="text/css">.tftable {font-size:12px;color:#333333;width:350px;border-width: 1px;border-color: #729ea5;border-collapse: collapse;}.tftable th {font-size:12px;background-color:#6DB000;border-width: 1px;padding: 8px;border-style: solid;border-color: #ccc;color:#fff}.tftable tr {background-color:#ffffff;}.tftable td {text-align: center;font-family:Courier, font-size:12px;border-width: 1px;padding: 8px;border-style: solid;border-color: #ccc;}.tftablehead{text-align: center;font-size:14px; font-weight:bold;}</style><table class="tftable" border="1"><tr><th  class="tftablehead" colspan="3">【Jenkins Server Status】</th></tr><tr><th>Link</th><th>Status</th><th>Code</th></tr>'${STATUS}'</table>'
######################################################################################################################
