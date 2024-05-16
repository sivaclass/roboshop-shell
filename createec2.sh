#!/bin/bash
AMI="ami-0f3c7d07486cad139"
Security_group="sg-02215d34f222346fe"
INSTANCE_TYPE="t2.micro"
instance=("Name=mongodb" "Name=web" "Name=catalouge")

for i in "${instance[@]}"
do

 INSTANCE_ID=$(aws ec2 run-instances --image-id "$AMI" --count 1 --instance-type "$INSTANCE_TYPE" --security-group-ids "$Security_group" --tag-specifications "ResourceType=instance,Tags=[$instance]" --query 'Instances[0].InstanceId' --output text)
echo "lanching the instance $INSTANCE_ID"


done