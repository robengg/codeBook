#!/bin/bash
# This is Advance XML Attribute Read and replace with Bash script 
# In this Example will use some xml demo file 
# To Understand the logic create demo file and run script
#########################################################
#PATTERN ::::: <project name="" path=""/>
########################################################
while IFS="" read -r line; do

   if [[ $line =~ project ]] ; then
     SOURCE_NAME=$(echo "$line" | grep -oP 'name="\K[^"]*' )
     SOURCE_PATH=$(echo "$line" | grep -oP 'path="\K[^"]*' )
   
     SOURCE_NAME_MODIFY="\""${SOURCE_NAME}"\""
     SOURCE_SOURCE_PATH="\""${SOURCE_PATH}"\""
   
     SOURCE_LINE=$(cat "default.xml" | grep -E ${SOURCE_NAME_MODIFY} | grep -E ${SOURCE_SOURCE_PATH} )
     SHA1=$(echo "${SOURCE_LINE}" | grep -oP 'revision="\K[^"]*' )
   
     REPLACED_LINE=$(cat "marge_manifest.xml" | grep -E ${SOURCE_NAME_MODIFY} | grep -E ${SOURCE_SOURCE_PATH} )
     SHA2=$(echo "${REPLACED_LINE}" | grep -oP 'revision="\K[^"]*' ) 
     
      if [ "${SHA1}" != "${SHA2}" ]; then
        echo ">>>>>>>>>>>>>>>>>>"
        echo "${SHA1}"
        echo "${SHA2}"
        $(sed -i 's/"${SHA2}"/"${SHA1}"/g' marge_manifest.xml)
        echo ">>>>>>>>>>>>>>>>>>Replaced!"
      fi
   
   fi
done < pattern.xml
