MODULE COPY_TPHYDS_MOD

USE YOMPHYDS, ONLY : TPHYDS

INTERFACE COPY
MODULE PROCEDURE COPY_TPHYDS
END INTERFACE

CONTAINS

SUBROUTINE COPY_TPHYDS (YD)

IMPLICIT NONE
TYPE (TPHYDS), INTENT (IN) :: YD

!$acc update device (YD%JPVXP)

!$acc update device (YD%JPVXP2)

!$acc update device (YD%JPCXP)

!$acc update device (YD%JPVEXTR)

!$acc update device (YD%JPVEXTRDI)

!$acc update device (YD%JPVXTR2)

!$acc update device (YD%JPVPRECIP)

!$acc update device (YD%JPVPRECIP2)

!$acc update device (YD%CEXTRP)

!$acc update device (YD%CXTRP2)

!$acc update device (YD%CVEXTRA)

!$acc update device (YD%CVEXRAD)

!$acc update device (YD%CVEXTRDI)

!$acc update device (YD%CVEXTR2)

!$acc update device (YD%CVPRECIP)

!$acc update device (YD%CVPRECIP2)

!$acc update device (YD%NEXTRPGB)

!$acc update device (YD%NXTRP2GB)

!$acc update device (YD%NVEXTRAGB)

!$acc update device (YD%NVEXRADGB)

!$acc update device (YD%NVEXTR2GB)

!$acc update device (YD%NVEXTRDIGB)

!$acc update device (YD%NVPRECIPGB)

!$acc update device (YD%NVPRECIPGB2)

!$acc update device (YD%NSFLUX)

!$acc update device (YD%NSFORC)

!$acc update device (YD%EXTRPDF)

!$acc update device (YD%XTRP2DF)

!$acc update device (YD%VEXTRADF)

!$acc update device (YD%VEXRADDF)

!$acc update device (YD%VEXTR2DF)

!$acc update device (YD%VEXTRDI)

!$acc update device (YD%VPRECIP)

!$acc update device (YD%VPRECIP2)

!$acc update device (YD%LREQIN_VEXTRDI)

!$acc update device (YD%LREQOUT_VEXTRDI)

END SUBROUTINE

END MODULE
