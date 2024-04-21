#!/usr/bin

echo "command line args:$@"
echo "No of command line args:$#"
echo "Prog name : $0"

echo "username :$USER"
echo "current dir:$PWD"
echo "home dir:$HOME"

echo "hostname:$HOSTNAME"
echo "pid of current process:$$"
sleep 60
echo "pid of background process:$!"