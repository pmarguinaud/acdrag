MODULE COPY_TPHY2_MOD

USE YOMPHY2, ONLY : TPHY2

INTERFACE COPY
MODULE PROCEDURE COPY_TPHY2
END INTERFACE

CONTAINS

SUBROUTINE COPY_TPHY2 (YD)

IMPLICIT NONE
TYPE (TPHY2), INTENT (IN) :: YD

!$acc update device (YD%NTSHM)

!$acc update device (YD%NTSML)

!$acc update device (YD%TSPHY)

!$acc update device (YD%XMUCVPP)

!$acc update device (YD%XMULAF)

!$acc update device (YD%XDAMP)

!$acc update device (YD%HCLP)

!$acc update device (YD%HTCLS)

!$acc update device (YD%HVCLS)

!$acc update device (YD%HTSHM)

!$acc update device (YD%HTSML)

!$acc update device (YD%HWMOHIGH)

!$acc update device (YD%HWMOLOW)

!$acc update device (YD%GZ0RAF)

!$acc update device (YD%FACRAF)

!$acc update device (YD%FACRAFCV)

!$acc update device (YD%FACRAFDCAPE)

!$acc update device (YD%GCAPERAF)

!$acc update device (YD%HTKERAF)

!$acc update device (YD%LRAFTUR)

!$acc update device (YD%LMULAF)

!$acc update device (YD%LWMOCLOUD)

!$acc update device (YD%LRAFTKE)

END SUBROUTINE

END MODULE
