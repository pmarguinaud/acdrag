MODULE COPY_TCST_MOD

USE YOMCST, ONLY : TCST

INTERFACE COPY
MODULE PROCEDURE COPY_TCST
END INTERFACE

CONTAINS

SUBROUTINE COPY_TCST (YD)

IMPLICIT NONE
TYPE (TCST), INTENT (IN) :: YD

!$acc update device (YD%RPI)

!$acc update device (YD%RCLUM)

!$acc update device (YD%RHPLA)

!$acc update device (YD%RKBOL)

!$acc update device (YD%RNAVO)

!$acc update device (YD%RDAY)

!$acc update device (YD%RDAYI)

!$acc update device (YD%RHOUR)

!$acc update device (YD%REA)

!$acc update device (YD%REPSM)

!$acc update device (YD%RSIYEA)

!$acc update device (YD%RSIDAY)

!$acc update device (YD%ROMEGA)

!$acc update device (YD%RA)

!$acc update device (YD%RG)

!$acc update device (YD%R1SA)

!$acc update device (YD%DEG2RAD)

!$acc update device (YD%RSIGMA)

!$acc update device (YD%RI0)

!$acc update device (YD%R)

!$acc update device (YD%RMD)

!$acc update device (YD%RMV)

!$acc update device (YD%RMO3)

!$acc update device (YD%RD)

!$acc update device (YD%RV)

!$acc update device (YD%RCPD)

!$acc update device (YD%RCPV)

!$acc update device (YD%RCVD)

!$acc update device (YD%RCVV)

!$acc update device (YD%RKAPPA)

!$acc update device (YD%RETV)

!$acc update device (YD%RMCO2)

!$acc update device (YD%RMCH4)

!$acc update device (YD%RMN2O)

!$acc update device (YD%RMCO)

!$acc update device (YD%RMHCHO)

!$acc update device (YD%RMNO2)

!$acc update device (YD%RMSO2)

!$acc update device (YD%RMSO4)

!$acc update device (YD%RMCFC11)

!$acc update device (YD%RMCFC12)

!$acc update device (YD%RMHCFC22)

!$acc update device (YD%RMCCL4)

!$acc update device (YD%RCW)

!$acc update device (YD%RCS)

!$acc update device (YD%RATM)

!$acc update device (YD%RTT)

!$acc update device (YD%RLVTT)

!$acc update device (YD%RLSTT)

!$acc update device (YD%RLVZER)

!$acc update device (YD%RLSZER)

!$acc update device (YD%RLMLT)

!$acc update device (YD%RDT)

!$acc update device (YD%RESTT)

!$acc update device (YD%RGAMW)

!$acc update device (YD%RBETW)

!$acc update device (YD%RALPW)

!$acc update device (YD%RGAMS)

!$acc update device (YD%RBETS)

!$acc update device (YD%RALPS)

!$acc update device (YD%RALPD)

!$acc update device (YD%RBETD)

!$acc update device (YD%RGAMD)

END SUBROUTINE

END MODULE
