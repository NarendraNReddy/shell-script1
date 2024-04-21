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

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "mysql server instllation"


dnf install git -y &>>$LOGFILE
VALIDATE $? "git  server instllation"

dnf install wrong -y &>>$LOGFILE
VALIDATE $? "wrong installation"

      

