#!/bin/bash
AMI="ami-0f3c7d07486cad139"
Security_group="sg-02215d34f222346fe"
instance=("mongodb" "web" "user")
TAG_NAME="Name=$instance[@}]"
for i in "${instance[@]}"
do

aws ec2 run-instances --image-id $AMI --instance-type t2.micro --security-group-ids $Security_group --tag-specifications 'ResourceType=instance,'
echo "lanching the instance $i"
aws ec2 create-tags --resources "$instance" --tags "$TAG_NAME" 

done