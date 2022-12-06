MODULE COPY_TLOUIS_MOD

USE YOMLOUIS, ONLY : TLOUIS

INTERFACE COPY
MODULE PROCEDURE COPY_TLOUIS
END INTERFACE

CONTAINS

SUBROUTINE COPY_TLOUIS (YD)

IMPLICIT NONE
TYPE (TLOUIS), INTENT (IN) :: YD

!$acc update device (YD%RLOUIS_S0)

!$acc update device (YD%PLOUIS_S0)

!$acc update device (YD%RLOUIS_GU1)

!$acc update device (YD%RLOUIS_GU2)

!$acc update device (YD%PLOUIS_GU1)

!$acc update device (YD%PLOUIS_GU2)

!$acc update device (YD%RLOUIS_GS1)

!$acc update device (YD%RLOUIS_GS2)

!$acc update device (YD%RLOUIS_GS3)

!$acc update device (YD%RLOUIS_GS4)

!$acc update device (YD%PLOUIS_GS1)

!$acc update device (YD%PLOUIS_GS2)

!$acc update device (YD%PLOUIS_GS3)

!$acc update device (YD%PLOUIS_GS4)

END SUBROUTINE

END MODULE
