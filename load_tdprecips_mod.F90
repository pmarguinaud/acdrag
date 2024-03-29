MODULE LOAD_TDPRECIPS_MOD

USE YOMDPRECIPS, ONLY : TDPRECIPS

INTERFACE LOAD
MODULE PROCEDURE LOAD_TDPRECIPS
END INTERFACE

CONTAINS

SUBROUTINE LOAD_TDPRECIPS (KLUN, YD)

IMPLICIT NONE
INTEGER, INTENT (IN) :: KLUN
TYPE (TDPRECIPS), INTENT (OUT) :: YD

READ (KLUN) YD%HDPRECIPS
READ (KLUN) YD%HDCLWC
READ (KLUN) YD%RDHAIL1
READ (KLUN) YD%RDHAIL2
READ (KLUN) YD%RDSEUIL1
READ (KLUN) YD%RDSEUIL2
READ (KLUN) YD%RDSEUIL3
READ (KLUN) YD%RDSEUIL4
READ (KLUN) YD%RDSEUIL5
READ (KLUN) YD%RDCLWC
READ (KLUN) YD%RPRECSEUIL
READ (KLUN) YD%RHTOP
READ (KLUN) YD%RTPW
READ (KLUN) YD%RAWARM
READ (KLUN) YD%RACOLD
READ (KLUN) YD%NDTPREC
READ (KLUN) YD%NDTPREC2
READ (KLUN) YD%NDTPRECCUR
READ (KLUN) YD%NDTPRECCUR2
END SUBROUTINE


END MODULE
