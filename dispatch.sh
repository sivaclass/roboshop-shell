#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIME=$(date +%F-%H-%M)
LOGFILE="/tmp/vijay$(date)-$0.log"
if [ $ID -ne 0 ]
then
    echo "pls login with ROOT user"
    exit 12
else
    echo " your ROOT user"
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e " $R Failed $2 $N"
        exit 1
    else
        echo -e "$G successfull $2 $N"
    fi
}

dnf install golang -y
VALIDATE $? "install golang"
id roboshop 
if [ $? -ne 0 ]
then
    useradd roboshop
    echo " roboshop user is created"
else
    echo "user roboshop existed"
fi
mkdir -p /app &>>$LOGFILE

curl -L -o /tmp/dispatch.zip https://roboshop-builds.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip
go mod init dispatch
go get 
go build
cp /home/centos/shell/roboshop-shell/dispatch.service  /etc/systemd/system/dispatch.service

systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch