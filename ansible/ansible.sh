#!bin/bash
VAR=$(id -u)
if [$VAR == 0]; then
yum install ansible -y
echo "ansible successfully installed"
else
echo "please log in with root user"
fi
