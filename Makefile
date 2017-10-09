.PHONY : clean all

all :
	cd bftsmart; mkdir -p bin; ant
	cd demos/zero/java/server; make
	cd demos/zero/java/client; make


clean :
	cd bftsmart; rm -rf bin
	cd demos/zero/java/server; make clean
	cd demos/zero/java/client; make clean
