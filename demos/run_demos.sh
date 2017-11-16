#!/bin/bash

set -e # quit on error
#set -x #debug mode

echo "Type in desired demo:"
echo "zero-plain (null request, no protocol buffers) -- only Java!"
echo "zero (null request, using protocol buffers) -- only Java and C."
echo "list2 (list application, different implementations) -- Java, C, C++, Python and Go"
echo "kv (key-value store) -- Java, C, C++, Python and Go"
echo " "

read
DEMO=$REPLY

for i in {0..3}
do
echo "Choose server $i language:"
echo "Available languages:"
find . -iname "run_$DEMO""_server.sh" | xargs -d'\n' -I'{}' bash -c 'basename $(dirname "{}")'
read
export SERVER$i=$REPLY
done

echo "Choose client language:"
echo "Available languages:"
find . -iname "run_$DEMO""_client.sh" | xargs -d'\n' -I'{}' bash -c 'basename $(dirname "{}")'
read
CLIENT=$REPLY

cd ..

[ -f ./demos/$SERVER0/run_"$DEMO"_server.sh ] || { echo ./demos/$SERVER0/run_"$DEMO"_server.sh not found. ; exit 2; }
[ -f ./demos/$SERVER1/run_"$DEMO"_server.sh ] || { echo ./demos/$SERVER1/run_"$DEMO"_server.sh not found. ; exit 2; }
[ -f ./demos/$SERVER2/run_"$DEMO"_server.sh ] || { echo ./demos/$SERVER2/run_"$DEMO"_server.sh not found. ; exit 2; }
[ -f ./demos/$SERVER3/run_"$DEMO"_server.sh ] || { echo ./demos/$SERVER3/run_"$DEMO"_server.sh not found. ; exit 2; }
[ -f ./demos/$CLIENT/run_"$DEMO"_client.sh ] || { echo ./demos/$CLIENT/run_"$DEMO"_client.sh not found. ; exit 2; }

xterm -T "SERVER 0 - $SERVER0" -e ./demos/$SERVER0/run_"$DEMO"_server.sh 0 &
sleep 2
xterm -T "SERVER 1 - $SERVER1" -e ./demos/$SERVER1/run_"$DEMO"_server.sh 1 &
sleep 2
xterm -T "SERVER 2 - $SERVER2" -e ./demos/$SERVER2/run_"$DEMO"_server.sh 2 &
sleep 2
xterm -T "SERVER 3 - $SERVER3" -e ./demos/$SERVER3/run_"$DEMO"_server.sh 3 &
sleep 2
#xterm -T "CLIENT - $CLIENT" -e ./demos/$CLIENT/run_"$DEMO"_client.sh 7001 &
echo ./demos/$CLIENT/run_"$DEMO"_client.sh 7001
./demos/$CLIENT/run_"$DEMO"_client.sh 7001

echo "Finished script execution successfully."
exit 0

