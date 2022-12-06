MODULE COPY_TARPHY_MOD

USE YOMARPHY, ONLY : TARPHY

INTERFACE COPY
MODULE PROCEDURE COPY_TARPHY
END INTERFACE

CONTAINS

SUBROUTINE COPY_TARPHY (YD)

IMPLICIT NONE
TYPE (TARPHY), INTENT (IN) :: YD

!$acc update device (YD%LMPA)

!$acc update device (YD%LMSE)

!$acc update device (YD%LMICRO)

!$acc update device (YD%LTURB)

!$acc update device (YD%LKFBCONV)

!$acc update device (YD%LKFBD)

!$acc update device (YD%LKFBS)

!$acc update device (YD%LMFSHAL)

!$acc update device (YD%LUSECHEM)

!$acc update device (YD%LORILAM)

!$acc update device (YD%LRDUST)

!$acc update device (YD%LRCO2)

!$acc update device (YD%LINITCHEM)

!$acc update device (YD%LINITORILAM)

!$acc update device (YD%LINITDUST)

!$acc update device (YD%LRDEPOS)

!$acc update device (YD%LBUFLUX)

!$acc update device (YD%CCOUPLING)

!$acc update device (YD%LMDUST)

!$acc update device (YD%LSURFEX_CRITICAL)

!$acc update device (YD%LSURFEX_KFROM)

!$acc update device (YD%NSURFEX_ITER)

!$acc update device (YD%LGRADHPHY)

!$acc update device (YD%NFLDCORE)

!$acc update device (YD%NGRADIENTS)

END SUBROUTINE

END MODULE
