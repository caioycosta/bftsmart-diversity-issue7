.PHONY : clean all

all :
	mkdir -p bin; pwd; ant -Dlib.dir=../../bftsmart/library/lib -Ddist.dir=../../bftsmart/bin -Dprotomsg.dir=../protobuf/zero/build -Dprotort.dir=../../protobuf/build
	cd list2; make

clean :
	rm -rf bin
	cd list2; make clean
