#!/usr/bin

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"


VALIDATE()
{
    if [ $? -ne 0 ];
    then
        echo -e "$2 is ... $R FAILURE $N"
        exit 1 
    else 
        echo -e "$2 is ....$G SUCCESS $N"    
    fi    
}

USERID=$(id -u)

if [ $USERID -ne 0 ];
then 
    echo "Please have a super user to install the packages"
    exit 1
else 
    echo "Super User"
fi 


for i in $@;
do  
    package to install $i &>>$LOGFILE
    dnf list installed $i &>>$LOGFILE

    if [ $? -eq 0 ];
    then 
        echo -e "$i already installed .. $Y SKIPPING $N"
    else 
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "$i installation"     
    fi
done     
