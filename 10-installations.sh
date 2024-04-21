#!/usr/bin

USERID=$(id -u)

if [ $USERID -ne 0 ];
then 
    echo "Please have a super user to install the packages"
    exit 1
else 
    echo "Super User"
fi 

dnf install mysql -y 

if [ $? -ne 0 ]:
then 
    echo "mysql installation ... FAILURE"
    exit 1
else 
    echo "mysql installation ... SUCCESS"
fi 


dnf install git -y 

if [ $? -ne 0];
then
    echo "git installation ... FAILURE"
    exit 1 
else    
    echo "Git installation ... SUCCESS"
fi        

