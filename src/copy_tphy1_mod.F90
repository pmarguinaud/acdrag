MODULE COPY_TPHY1_MOD

USE YOMPHY1, ONLY : TPHY1

INTERFACE COPY
MODULE PROCEDURE COPY_TPHY1
END INTERFACE

CONTAINS

SUBROUTINE COPY_TPHY1 (YD)

IMPLICIT NONE
TYPE (TPHY1), INTENT (IN) :: YD

!$acc update device (YD%GF3)

!$acc update device (YD%GF4)

!$acc update device (YD%TREF4)

!$acc update device (YD%RCTVEG)

!$acc update device (YD%RGL)

!$acc update device (YD%SODELX)

!$acc update device (YD%GCZ0H)

!$acc update device (YD%ALBGLA)

!$acc update device (YD%ALBMAX)

!$acc update device (YD%ALBMER)

!$acc update device (YD%ALBMED)

!$acc update device (YD%ALBMIN)

!$acc update device (YD%ALCRIN)

!$acc update device (YD%ALRCN1)

!$acc update device (YD%ALRCN2)

!$acc update device (YD%EA)

!$acc update device (YD%EC2REF)

!$acc update device (YD%EMCRIN)

!$acc update device (YD%EMMGLA)

!$acc update device (YD%EMMMER)

!$acc update device (YD%EWFC)

!$acc update device (YD%EWWILT)

!$acc update device (YD%GA)

!$acc update device (YD%GC1)

!$acc update device (YD%GC1S1)

!$acc update device (YD%GC1S2)

!$acc update device (YD%GC1S3)

!$acc update device (YD%GC1S4)

!$acc update device (YD%GC1Y1)

!$acc update device (YD%GTSVAP)

!$acc update device (YD%GVEGMX)

!$acc update device (YD%GLAIMX)

!$acc update device (YD%GNEIMX)

!$acc update device (YD%GWPIMX)

!$acc update device (YD%GCGEL)

!$acc update device (YD%GC2)

!$acc update device (YD%GC2REF)

!$acc update device (YD%GC3)

!$acc update device (YD%GC31)

!$acc update device (YD%GC32)

!$acc update device (YD%GCONV)

!$acc update device (YD%GF1)

!$acc update device (YD%GWFC)

!$acc update device (YD%GWLEX)

!$acc update device (YD%GWLMX)

!$acc update device (YD%GWWILT)

!$acc update device (YD%G1B)

!$acc update device (YD%G1CGSAT)

!$acc update device (YD%G1C1SAT)

!$acc update device (YD%G1P)

!$acc update device (YD%G1WSAT)

!$acc update device (YD%G2B)

!$acc update device (YD%G2CGSAT)

!$acc update device (YD%G2C1SAT)

!$acc update device (YD%G2P)

!$acc update device (YD%G2WSAT)

!$acc update device (YD%G3CGSAT)

!$acc update device (YD%GSNC1)

!$acc update device (YD%GSNC2)

!$acc update device (YD%HSOL)

!$acc update device (YD%HSOLIWR)

!$acc update device (YD%HSOLIT0)

!$acc update device (YD%OMTPRO)

!$acc update device (YD%OMWPRO)

!$acc update device (YD%RC1MAX)

!$acc update device (YD%RCTGLA)

!$acc update device (YD%RCGMAX)

!$acc update device (YD%RD1)

!$acc update device (YD%RD2GLA)

!$acc update device (YD%RD2MER)

!$acc update device (YD%RHOMAX)

!$acc update device (YD%RHOMIN)

!$acc update device (YD%RSMAX)

!$acc update device (YD%RTINER)

!$acc update device (YD%RZ0GLA)

!$acc update device (YD%RZ0MER)

!$acc update device (YD%RZHZ0G)

!$acc update device (YD%RZHZ0M)

!$acc update device (YD%TMERGL)

!$acc update device (YD%TOEXP)

!$acc update device (YD%TOLIN)

!$acc update device (YD%WCRIN)

!$acc update device (YD%WCRINC)

!$acc update device (YD%WCRING)

!$acc update device (YD%WNEW)

!$acc update device (YD%WPMX)

!$acc update device (YD%WSMX)

!$acc update device (YD%XCRINR)

!$acc update device (YD%XCRINV)

!$acc update device (YD%LALBMERCLIM)

!$acc update device (YD%LIMC)

!$acc update device (YD%LIMW)

!$acc update device (YD%LC1VAP)

!$acc update device (YD%LCLS_HS)

!$acc update device (YD%NTVGLA)

!$acc update device (YD%NTVMER)

!$acc update device (YD%GCGELS)

!$acc update device (YD%GVEGMXS)

!$acc update device (YD%GLAIMXS)

!$acc update device (YD%GNEIMXS)

!$acc update device (YD%ALB1)

!$acc update device (YD%ALB2)

!$acc update device (YD%RLAIMX)

!$acc update device (YD%RLAI)

!$acc update device (YD%ACLS_HS)

!$acc update device (YD%NCHSP)

END SUBROUTINE

END MODULE
