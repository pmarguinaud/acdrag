#FC=gfortran -fconvert=big-endian -g -O0 
# -check bounds -traceback

#FC=nvfortran -byteswapio -O3 -g -Mbounds -traceback
FC=nvfortran -byteswapio
FC += -acc=gpu -Minfo=accel -Mcuda=ptxinfo -Mlarge_arrays -gpu=lineinfo
