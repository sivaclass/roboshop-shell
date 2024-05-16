#!/bin/bash
VAR=$(id -u)
if [ $VAR -ne 0 ]
then
    echo "please log in with root user"
else
    echo "you are in root user"
fi
yum install ansible -y
