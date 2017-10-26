#!/bin/bash

set -e # quit on error

echo "Choose demo:"
echo "zn) zero (null request, no protocol buffers) -- only Java!"
echo "z) zero (null request, using protocol buffers) -- only Java and C."

read
case $REPLY in
zn)
	echo "Zero (no protocol buffers) selected."
	DEMO=zero-plain
;;
z)
        echo "Zero (with protocol buffers) selected."
        DEMO=zero
;;
*)
	echo "Invalid option."
	exit 1
;;
esac

echo "Choose server 0 language:"
echo "j) java"
echo "c) C"
read
case $REPLY in
j)
        echo "Java selected."
        SERVER0=java
;;
c)
	echo "C selected."
	SERVER0=c
;;
*)
        echo "Invalid option."
        exit 1
;;
esac

echo "Choose server 1 language:"
echo "c) C"
echo "j) java"
read
case $REPLY in
c)
        echo "C selected."
        SERVER1=c
;;
j)
        echo "Java selected."
        SERVER1=java
;;
*)
        echo "Invalid option."
        exit 1
;;
esac

echo "Choose server 2 language:"
echo "c) C"
echo "j) java"
read
case $REPLY in
c)
        echo "C selected."
        SERVER2=c
;;
j)
        echo "Java selected."
        SERVER2=java
;;
*)
        echo "Invalid option."
        exit 1
;;
esac

echo "Choose server 3 language:"
echo "c) C"
echo "j) java"
read
case $REPLY in
j)
        echo "Java selected."
        SERVER3=java
;;
c)
        echo "C selected."
        SERVER3=c
;;
*)
        echo "Invalid option."
        exit 1
;;
esac

echo "Choose client language:"
echo "c) C"
echo "j) java"
read
case $REPLY in
j)
        echo "Java selected."
        CLIENT=java
;;
c)
        echo "C selected."
        CLIENT=c
;;
*)
        echo "Invalid option."
        exit 1
;;
esac

cd ..

[ -f ./demos/$SERVER0/run_"$DEMO"_server.sh ] || { echo ./demos/$SERVER0/run_"$DEMO"_server.sh not found. ; exit 2; }
[ -f ./demos/$SERVER1/run_"$DEMO"_server.sh ] || { echo ./demos/$SERVER1/run_"$DEMO"_server.sh not found. ; exit 2; }
[ -f ./demos/$SERVER2/run_"$DEMO"_server.sh ] || { echo ./demos/$SERVER2/run_"$DEMO"_server.sh not found. ; exit 2; }
[ -f ./demos/$SERVER3/run_"$DEMO"_server.sh ] || { echo ./demos/$SERVER3/run_"$DEMO"_server.sh not found. ; exit 2; }
[ -f ./demos/$CLIENT/run_"$DEMO"_server.sh ] || { echo ./demos/$CLIENT/run_"$DEMO"_server.sh not found. ; exit 2; }

xterm -T "SERVER 0 - $SERVER0" -e ./demos/$SERVER0/run_"$DEMO"_server.sh 0 &
sleep 2
xterm -T "SERVER 1 - $SERVER1" -e ./demos/$SERVER1/run_"$DEMO"_server.sh 1 &
sleep 2
xterm -T "SERVER 2 - $SERVER2" -e ./demos/$SERVER2/run_"$DEMO"_server.sh 2 &
sleep 2
xterm -T "SERVER 3 - $SERVER3" -e ./demos/$SERVER3/run_"$DEMO"_server.sh 3 &
sleep 2
xterm -T "CLIENT - $CLIENT" -e ./demos/$CLIENT/run_"$DEMO"_client.sh 7001 &

echo "Finished script execution successfully."
exit 0

