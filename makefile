CC=gcc
MPATH=../mio
APATH=../matrix
DPATH=../distributions
EPATH=../euca-cutils
LPATH=${APATH}/lapack-3.5.0/lapacke/include/
CFLAGS=-g -I${MPATH} -I${APATH} -I${LPATH} -I${EPATH} -I${DPATH} -I/usr/local/include

LLIB=-L${APATH}/lapack-3.5.0 -L/usr/local/Cellar/gcc/6.1.0/lib/gcc/6/ -llapacke -llapack -lblas -lgfortran
ALIB=${APATH}/mioarray.o
LIBS=${MPATH}/mymalloc.o ${MPATH}/mio.o ${EPATH}/libutils.a -lm ${DPATH}/normal.o ${ALIB} ${LLIB}

#LLIB=-L./lapack-3.5.0 -L/usr/local/Cellar/gcc/4.9.2_1/lib/gcc/4.9/ -llapacke -llapack -lrefblas -lblas -ltmglib -lgfortran

all: ssa-cp

ssa-cp: ssa-cp.c
	${CC} ${CFLAGS} -DSTANDALONE -DUSELAPACK -o ssa-cp ssa-cp.c ${LIBS}

clean:
	rm *.o ssa-cp mioregress-test mioarray-test
