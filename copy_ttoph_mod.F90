MODULE COPY_TTOPH_MOD

USE YOMTOPH, ONLY : TTOPH

INTERFACE COPY
MODULE PROCEDURE COPY_TTOPH
END INTERFACE

CONTAINS

SUBROUTINE COPY_TTOPH (YD)

IMPLICIT NONE
TYPE (TTOPH), INTENT (IN) :: YD

!$acc enter data create (YD%RMESOU)
!$acc update device (YD%RMESOU)
!$acc enter data attach (YD%RMESOU)

!$acc enter data create (YD%RMESOT)
!$acc update device (YD%RMESOT)
!$acc enter data attach (YD%RMESOT)

!$acc enter data create (YD%RMESOQ)
!$acc update device (YD%RMESOQ)
!$acc enter data attach (YD%RMESOQ)

!$acc update device (YD%RFMESOQ)

!$acc update device (YD%NTQSAT)

!$acc update device (YD%NTDIFU)

!$acc update device (YD%NTCOEF)

!$acc update device (YD%NTDRAG)

!$acc update device (YD%NTCVIM)

!$acc update device (YD%NT850)

!$acc update device (YD%NT950)

!$acc update device (YD%NTPLUI)

!$acc update device (YD%NTRADI)

!$acc update device (YD%NTNEBU)

!$acc update device (YD%NTOZON)

!$acc update device (YD%NTDRME)

!$acc update device (YD%NTCOET)

!$acc update device (YD%NTAJUC)

!$acc update device (YD%NTRELAXT)

!$acc update device (YD%NTRELAXQ)

!$acc update device (YD%NTRELAXU)

!$acc update device (YD%ETQSAT)

!$acc update device (YD%ETDIFU)

!$acc update device (YD%ETCOEF)

!$acc update device (YD%ETDRAG)

!$acc update device (YD%ETCVIM)

!$acc update device (YD%ET850)

!$acc update device (YD%ET950)

!$acc update device (YD%ETPLUI)

!$acc update device (YD%ETRADI)

!$acc update device (YD%ETNEBU)

!$acc update device (YD%ETOZON)

!$acc update device (YD%ETDRME)

!$acc update device (YD%ETCOET)

!$acc update device (YD%ETAJUC)

!$acc update device (YD%ETRELAXT)

!$acc update device (YD%ETRELAXQ)

!$acc update device (YD%ETRELAXU)

!$acc update device (YD%XDRMUK)

!$acc update device (YD%XDRMUX)

!$acc update device (YD%XDRMUP)

!$acc update device (YD%XDRMTK)

!$acc update device (YD%XDRMTX)

!$acc update device (YD%XDRMTP)

!$acc update device (YD%XDRMQK)

!$acc update device (YD%XDRMQP)

!$acc update device (YD%XDRMQX)

!$acc update device (YD%RCLX)

!$acc update device (YD%TPSCLIM)

END SUBROUTINE

END MODULE
