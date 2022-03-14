MODULE COPY_TMSE_MOD

USE YOMMSE, ONLY : TMSE

INTERFACE COPY
MODULE PROCEDURE COPY_TMSE
END INTERFACE

CONTAINS

SUBROUTINE COPY_TMSE (YD)

IMPLICIT NONE
TYPE (TMSE), INTENT (IN) :: YD

!$acc update device (YD%LPGDFWR)

!$acc update device (YD%LHISFWR)

!$acc update device (YD%LFTZERO)

!$acc update device (YD%NSURFEXCTLMAX)

!$acc update device (YD%NSURFEXCTL)

!$acc update device (YD%CPREFIX_SFX1)

!$acc update device (YD%CPREFIX_SFX2)

!$acc update device (YD%XZSEPS)

END SUBROUTINE

END MODULE
