MODULE COPY_TCVMNH_MOD

USE YOMCVMNH, ONLY : TCVMNH

INTERFACE COPY
MODULE PROCEDURE COPY_TCVMNH
END INTERFACE

CONTAINS

SUBROUTINE COPY_TCVMNH (YD)

IMPLICIT NONE
TYPE (TCVMNH), INTENT (IN) :: YD

!$acc update device (YD%LDEEP)

!$acc update device (YD%LSHALLOW)

!$acc update device (YD%LDIAGCONV)

!$acc update device (YD%LSETTADJ)

!$acc update device (YD%LREFRESH_ALL)

!$acc update device (YD%LDOWN)

!$acc update device (YD%LSMOOTH)

!$acc update device (YD%OTADJD)

!$acc update device (YD%OTADJS)

!$acc update device (YD%NSETENS)

!$acc update device (YD%NIICE)

!$acc update device (YD%XA25)

!$acc update device (YD%XCRAD)

!$acc update device (YD%XCDEPTH)

!$acc update device (YD%XCDEPTH_D)

!$acc update device (YD%XDTPERT)

!$acc update device (YD%XENTR)

!$acc update device (YD%XZLCL)

!$acc update device (YD%XZPBL)

!$acc update device (YD%XWTRIG)

!$acc update device (YD%XNHGAM)

!$acc update device (YD%XTFRZ1)

!$acc update device (YD%XTFRZ2)

!$acc update device (YD%XSTABT)

!$acc update device (YD%XSTABC)

!$acc update device (YD%XAW)

!$acc update device (YD%XBW)

!$acc update device (YD%XATPERT)

!$acc update device (YD%XBTPERT)

END SUBROUTINE

END MODULE
