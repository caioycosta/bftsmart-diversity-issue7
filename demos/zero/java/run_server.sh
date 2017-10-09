[ $# -eq 0 ] && { echo "Usage: $0 id_replica"; exit 1; }

BASEFOLDER=`pwd`/`dirname $0`

#sair imediatamente em caso de erro
set -e

java -cp "$BASEFOLDER/../../../bftsmart/library/lib/*:"\
"$BASEFOLDER/../../../bftsmart/bin/BFT-SMaRt.jar:"\
"$BASEFOLDER/server/bin/ZeroServer.jar" bftsmart.diversity.demos.zero.ServerLaunch $1 0


