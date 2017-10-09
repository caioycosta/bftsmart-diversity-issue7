.PHONY : clean all

all :
	cd bftsmart; mkdir -p bin; ant
	cd demos/zero/java/server; make


clean :
	cd bftsmart; rm -rf bin
	cd demos/zero/java/server; make clean
