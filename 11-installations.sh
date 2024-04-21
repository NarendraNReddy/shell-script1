#!/usr/bin
VALIDATE()
{
    if [ $? -ne 0 ];
    then
        echo "$2 is ... FAILURE"
        exit 1 
    else 
        echo "$2 is .... SUCCESS"    
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

dnf install mysql -y 
VALIDATE $? "mysql server instllation"




dnf install git -y 
VALIDATE $? "git  server instllation"

      
