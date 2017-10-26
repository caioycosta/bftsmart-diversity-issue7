#!/bin/bash

set -e # quit on error

echo "Choose demo:"
echo "z) zero (null request)"
read
case $REPLY in
z)
	echo "Zero selected."
	DEMO=zero
;;
*)
	echo "Invalid option."
	exit 1
;;
esac

echo "Choose server 0 language:"
echo "j) java"
read
case $REPLY in
j)
        echo "Java selected."
        SERVER0=java
;;
*)
        echo "Invalid option."
        exit 1
;;
esac

echo "Choose server 1 language:"
echo "j) java"
read
case $REPLY in
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
echo "j) java"
read
case $REPLY in
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
echo "j) java"
read
case $REPLY in
j)
        echo "Java selected."
        SERVER3=java
;;
*)
        echo "Invalid option."
        exit 1
;;
esac

echo "Choose client language:"
echo "j) java"
read
case $REPLY in
j)
        echo "Java selected."
        CLIENT=java
;;
*)
        echo "Invalid option."
        exit 1
;;
esac

cd ..
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

