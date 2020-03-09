#!/bin/bash
#This Job Explain How to create XML file with shell script 
#Please comment if you have anu Question
################################################################################

defaultpath=xmlbuild/

exec 3>snapshot.xml #Creating merger_snapshot file

#HEADER (Common for all xml)
echo '&3'
echo '<?xml version="1.0" encoding="UTF-8"?>' >&3
echo '  <manifest>' >&3
echo '	<name="origin" system="https://google.com/"/>' >&3
echo '	<default name="origin" system="ubuntu/bar/2" sync-j="2"/>' >&3


echo '  </manifest>' >&3
#################################################################################
