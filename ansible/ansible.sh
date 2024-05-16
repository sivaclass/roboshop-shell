#!bin/bash
VAR=$(id -u)
if ["$VAR" != 0]; then
echo "please log in with root user"
exit1
else
echo "you are in root user"
fi
yum install ansible -y
