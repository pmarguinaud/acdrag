MODULE COPY_TVDOZ_MOD

USE YOMVDOZ, ONLY : TVDOZ

INTERFACE COPY
MODULE PROCEDURE COPY_TVDOZ
END INTERFACE

CONTAINS

SUBROUTINE COPY_TVDOZ (YD)

IMPLICIT NONE
TYPE (TVDOZ), INTENT (IN) :: YD

!$acc update device (YD%VDHJS)

!$acc update device (YD%VDHJH)

!$acc update device (YD%VDHNS)

!$acc update device (YD%VDHNH)

!$acc update device (YD%VDPJS)

!$acc update device (YD%VDPJH)

!$acc update device (YD%VDPNS)

!$acc update device (YD%VDPNH)

!$acc update device (YD%VDEJS)

!$acc update device (YD%VDEJH)

!$acc update device (YD%VDENS)

!$acc update device (YD%VDENH)

!$acc update device (YD%VDAJS)

!$acc update device (YD%VDAJH)

!$acc update device (YD%VDANS)

!$acc update device (YD%VDANH)

!$acc update device (YD%VDNJS)

!$acc update device (YD%VDNJH)

!$acc update device (YD%VDNNS)

!$acc update device (YD%VDNNH)

!$acc update device (YD%VOZNJ)

!$acc update device (YD%VOZHS)

!$acc update device (YD%LRDIFOZ)

!$acc update device (YD%LRDEPOZ)

END SUBROUTINE

END MODULE
