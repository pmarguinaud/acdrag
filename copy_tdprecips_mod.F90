MODULE COPY_TDPRECIPS_MOD

USE YOMDPRECIPS, ONLY : TDPRECIPS

INTERFACE COPY
MODULE PROCEDURE COPY_TDPRECIPS
END INTERFACE

CONTAINS

SUBROUTINE COPY_TDPRECIPS (YD)

IMPLICIT NONE
TYPE (TDPRECIPS), INTENT (IN) :: YD

!$acc update device (YD%HDPRECIPS)

!$acc update device (YD%HDCLWC)

!$acc update device (YD%RDHAIL1)

!$acc update device (YD%RDHAIL2)

!$acc update device (YD%RDSEUIL1)

!$acc update device (YD%RDSEUIL2)

!$acc update device (YD%RDSEUIL3)

!$acc update device (YD%RDSEUIL4)

!$acc update device (YD%RDSEUIL5)

!$acc update device (YD%RDCLWC)

!$acc update device (YD%RPRECSEUIL)

!$acc update device (YD%RHTOP)

!$acc update device (YD%RTPW)

!$acc update device (YD%RAWARM)

!$acc update device (YD%RACOLD)

!$acc update device (YD%NDTPREC)

!$acc update device (YD%NDTPREC2)

!$acc update device (YD%NDTPRECCUR)

!$acc update device (YD%NDTPRECCUR2)

END SUBROUTINE

END MODULE
