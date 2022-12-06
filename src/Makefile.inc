#FC=gfortran -fconvert=big-endian -g -O0 
# -check bounds -traceback

#FC=nvfortran -byteswapio -O3 -g -Mbounds -traceback
FC=nvfortran
FC=mpif90 -D_MPI
FC += -byteswapio -tp=skylake -fPIC -O3 -g -traceback
#FC += -acc=gpu -gpu=cc80 -Minfo=accel -Mcuda=ptxinfo -Mlarge_arrays -gpu=lineinfo
