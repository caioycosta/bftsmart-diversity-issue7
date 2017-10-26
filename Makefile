.PHONY : clean all

all :
	cd bftsmart; mkdir -p bin; ant
	cd demos/java; make


clean :
	cd bftsmart; rm -rf bin
	cd demos/java; make clean
