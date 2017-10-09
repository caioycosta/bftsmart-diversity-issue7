.PHONY : clean all

all :
	cd bftsmart; mkdir -p bin; ant



clean :
	cd bftsmart; rm -rf bin
