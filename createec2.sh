#!/bin/bash
AMI="ami-0f3c7d07486cad139"
Security_group="sg-02215d34f222346fe"
instance_type1="t2.micro"
type2="t3.micro"

instance=("mongodb" "web" "catalouge")

for i in "${instance[@]}"
do
if [ "$instance" -eq mongodb ] ||  [ "$instance" -eq web ]; then
     INSTANCE_TYPE="t3.small"
else
     INSTANCE_TYPE="t2.small"
fi

 aws ec2 run-instances --image-id $AMI --instance-type t2.micro --security-group-ids $Security_group --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"
    
echo "lanching the instance $i"


done