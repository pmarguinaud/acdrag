MODULE COPY_TSIMPHL_MOD

USE YOMSIMPHL, ONLY : TSIMPHL

INTERFACE COPY
MODULE PROCEDURE COPY_TSIMPHL
END INTERFACE

CONTAINS

SUBROUTINE COPY_TSIMPHL (YD)

IMPLICIT NONE
TYPE (TSIMPHL), INTENT (IN) :: YD

!$acc update device (YD%LSIMPH)

!$acc update device (YD%LTRAJPS)

!$acc update device (YD%LTRAJPST)

!$acc update device (YD%LSMOOTHD)

!$acc update device (YD%LSMOOTHA)

!$acc update device (YD%LSMOOTHB)

!$acc update device (YD%LCVRASP)

!$acc update device (YD%LGWDSP)

!$acc update device (YD%LRAYSP)

!$acc update device (YD%LSTRASP)

!$acc update device (YD%LVDIFSP)

!$acc update device (YD%LVDIFSPNL)

!$acc update device (YD%LRRMESSP)

!$acc update device (YD%LCLOUDS)

!$acc update device (YD%LGWDSPNL)

!$acc update device (YD%LSTRASPN)

!$acc update device (YD%LPROCLDTL)

!$acc update device (YD%LMELTTL)

!$acc update device (YD%LMELTNL)

!$acc update device (YD%LMICROTL)

!$acc update device (YD%LTRAJRAIN)

!$acc update device (YD%LTRAJCOND)

!$acc update device (YD%LNEBCVPPKF)

!$acc update device (YD%LCOLLECTL)

!$acc update device (YD%LEVAPTL)

!$acc update device (YD%LSMOOTHEVP)

!$acc update device (YD%LIGELREPRO)

!$acc update device (YD%LCVRASBM)

!$acc update device (YD%LCONSENTH)

!$acc update device (YD%LAPPROXCONV)

!$acc update device (YD%RHCRIT1S)

!$acc update device (YD%RHCRIT2S)

!$acc update device (YD%TADJ)

!$acc update device (YD%RMINEVP)

!$acc update device (YD%DELTAH)

!$acc update device (YD%RMODULQCPROG)

END SUBROUTINE

END MODULE
