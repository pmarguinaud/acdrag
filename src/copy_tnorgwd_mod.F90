MODULE COPY_TNORGWD_MOD

USE YOMNORGWD, ONLY : TNORGWD

INTERFACE COPY
MODULE PROCEDURE COPY_TNORGWD
END INTERFACE

CONTAINS

SUBROUTINE COPY_TNORGWD (YD)

IMPLICIT NONE
TYPE (TNORGWD), INTENT (IN) :: YD

!$acc update device (YD%NORGWD_SCHEME)

!$acc update device (YD%NORGWD_PRMAX)

!$acc update device (YD%NORGWD_DZ)

!$acc update device (YD%NORGWD_PTROPO)

!$acc update device (YD%NORGWD_NTROPO)

!$acc update device (YD%NORGWD_RUWMAX)

!$acc update device (YD%NORGWD_SAT)

!$acc update device (YD%NORGWD_RDISS)

!$acc update device (YD%NORGWD_DELTAT)

!$acc update device (YD%NORGWD_KMIN)

!$acc update device (YD%NORGWD_KMAX)

!$acc update device (YD%NORGWD_CMIN)

!$acc update device (YD%NORGWD_CMAX)

!$acc update device (YD%NORGWD_PLAUNCH)

!$acc update device (YD%NORGWD_NLAUNCH)

!$acc update device (YD%NORGWD_PNOVERDIF)

!$acc update device (YD%NORGWD_NNOVERDIF)

!$acc update device (YD%NORGWD_DZFRON)

!$acc update device (YD%NORGWD_GFRON)

!$acc update device (YD%NORGWD_GB)

END SUBROUTINE

END MODULE
