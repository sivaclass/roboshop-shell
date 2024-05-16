#!/bin/bash
AMI="ami-0f3c7d07486cad139"
Security_group="sg-02215d34f222346fe"
instance=("mongodb" "web" "user")

for i in "${instance[@]}"
do

aws ec2 run-instances --image-id $AMI --instance-type t2.micro --security-group-ids $Security_group 
--tag-specifications 'ResourceType=instance,Tags="Key1=$instance[@]"'
echo "lanching the instance $i"


done