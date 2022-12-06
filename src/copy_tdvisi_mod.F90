MODULE COPY_TDVISI_MOD

USE YOMDVISI, ONLY : TDVISI

INTERFACE COPY
MODULE PROCEDURE COPY_TDVISI
END INTERFACE

CONTAINS

SUBROUTINE COPY_TDVISI (YD)

IMPLICIT NONE
TYPE (TDVISI), INTENT (IN) :: YD

!$acc update device (YD%HVISI)

!$acc update device (YD%COEF_CM1)

!$acc update device (YD%COEF_CM2)

!$acc update device (YD%COEF_CM3)

!$acc update device (YD%COEF_CM4)

!$acc update device (YD%COEF_RM1)

!$acc update device (YD%COEF_RM2)

!$acc update device (YD%COEF_IM1)

!$acc update device (YD%COEF_IM2)

!$acc update device (YD%COEF_SM1)

!$acc update device (YD%COEF_SM2)

!$acc update device (YD%COEF_GM1)

!$acc update device (YD%COEF_GM2)

END SUBROUTINE

END MODULE
