MODULE COPY_TPHY3_MOD

USE YOMPHY3, ONLY : TPHY3

INTERFACE COPY
MODULE PROCEDURE COPY_TPHY3
END INTERFACE

CONTAINS

SUBROUTINE COPY_TPHY3 (YD)

IMPLICIT NONE
TYPE (TPHY3), INTENT (IN) :: YD

!$acc update device (YD%N_SPBAND)

!$acc update device (YD%RTL)

!$acc update device (YD%BSFSA)

!$acc update device (YD%BSFSI)

!$acc update device (YD%BSFSN)

!$acc update device (YD%BSFTA)

!$acc update device (YD%BSFTI)

!$acc update device (YD%BSFTN)

!$acc update device (YD%EARRT)

!$acc update device (YD%EOASA)

!$acc update device (YD%EOASI)

!$acc update device (YD%EOASN)

!$acc update device (YD%EOATA)

!$acc update device (YD%EOATI)

!$acc update device (YD%EOATN)

!$acc update device (YD%EODSA)

!$acc update device (YD%EODSI)

!$acc update device (YD%EODSN)

!$acc update device (YD%EODTA)

!$acc update device (YD%EODTI)

!$acc update device (YD%EODTN)

!$acc update device (YD%EORAY)

!$acc update device (YD%GCA)

!$acc update device (YD%GCB)

!$acc update device (YD%GCC)

!$acc update device (YD%GCD4)

!$acc update device (YD%GCE4)

!$acc update device (YD%GIREC1)

!$acc update device (YD%GIREC2)

!$acc update device (YD%GIREC3)

!$acc update device (YD%GIREC4)

!$acc update device (YD%QCO2)

!$acc update device (YD%RII0)

!$acc update device (YD%USAA)

!$acc update device (YD%USAI)

!$acc update device (YD%USAN)

!$acc update device (YD%USBA)

!$acc update device (YD%USBI)

!$acc update device (YD%USBN)

!$acc update device (YD%VDP)

!$acc update device (YD%VNP)

!$acc update device (YD%REXP_NEB)

!$acc update device (YD%FCM_DEL_A)

!$acc update device (YD%FCM_DEL_D)

!$acc update device (YD%FCM_MU_A)

!$acc update device (YD%FCM_MU_D)

!$acc update device (YD%FCM_N_I)

!$acc update device (YD%FCM_N_L)

!$acc update device (YD%FCM_AI)

!$acc update device (YD%FCM_AL)

!$acc update device (YD%FCM_B_AI)

!$acc update device (YD%FCM_B_AL)

!$acc update device (YD%FCM_B_BI)

!$acc update device (YD%FCM_B_BL)

!$acc update device (YD%FCM_DEL_AI)

!$acc update device (YD%FCM_DEL_AL)

!$acc update device (YD%FCM_DEL_DI)

!$acc update device (YD%FCM_DEL_DL)

!$acc update device (YD%FCM_MU_AI)

!$acc update device (YD%FCM_MU_AL)

!$acc update device (YD%FCM_MU_DI)

!$acc update device (YD%FCM_MU_DL)

!$acc update device (YD%FCM_NU_AI)

!$acc update device (YD%FCM_NU_AL)

!$acc update device (YD%FCM_NU_DI)

!$acc update device (YD%FCM_NU_DL)

!$acc update device (YD%FCM_IWC2DE)

!$acc update device (YD%FCM_LWC2RE)

!$acc update device (YD%FCM_P_AI)

!$acc update device (YD%FCM_P_AL)

!$acc update device (YD%FCM_P_DI)

!$acc update device (YD%FCM_P_DL)

!$acc update device (YD%FCM_P_GI)

!$acc update device (YD%FCM_P_GL)

!$acc update device (YD%FCM_Q_AI)

!$acc update device (YD%FCM_Q_AL)

!$acc update device (YD%FCM_Q_DI)

!$acc update device (YD%FCM_Q_DL)

!$acc update device (YD%FCM_Q_GI)

!$acc update device (YD%FCM_Q_GL)

!$acc update device (YD%FSM_AA)

!$acc update device (YD%FSM_BB)

!$acc update device (YD%FSM_CC)

!$acc update device (YD%FSM_DD)

!$acc update device (YD%FSM_EE)

!$acc update device (YD%FSM_FF)

!$acc update device (YD%FSM_GG)

!$acc update device (YD%FSM_HH)

!$acc update device (YD%FSM_II)

!$acc update device (YD%GOLCA)

!$acc update device (YD%GOLCB)

!$acc update device (YD%GOLCC)

!$acc update device (YD%FGTS_A)

!$acc update device (YD%FGTS_B)

!$acc update device (YD%FGTS_C)

!$acc update device (YD%FGTS_ALPHA)

!$acc update device (YD%FGTS_DELTA0)

!$acc update device (YD%FGTS_D)

!$acc update device (YD%FGTS_P00)

!$acc update device (YD%FGTS_P)

!$acc update device (YD%FGTS_Q)

!$acc update device (YD%FGTS_OA)

!$acc update device (YD%FGTS_OB)

!$acc update device (YD%FGTS_OC)

!$acc update device (YD%FGTS_OD)

!$acc update device (YD%FGTC_A)

!$acc update device (YD%FGTC_B)

!$acc update device (YD%FGTC_C)

!$acc update device (YD%FGTC_ALPHA)

!$acc update device (YD%FGTC_DELTA0)

!$acc update device (YD%FGTC_D)

!$acc update device (YD%FGTC_P00)

!$acc update device (YD%FGTC_P)

!$acc update device (YD%FGTC_Q)

!$acc update device (YD%FGTC_OA)

!$acc update device (YD%FGTC_OB)

!$acc update device (YD%FGTC_OC)

!$acc update device (YD%FGTC_OD)

!$acc update device (YD%FGTT_A)

!$acc update device (YD%FGTT_B)

!$acc update device (YD%FGTT_C)

!$acc update device (YD%FGTT_ALPHA)

!$acc update device (YD%FGTT_DELTA0)

!$acc update device (YD%FGTT_D)

!$acc update device (YD%FGTT_P00)

!$acc update device (YD%FGTT_P)

!$acc update device (YD%FGTT_Q)

!$acc update device (YD%FGTT_OA)

!$acc update device (YD%FGTT_OB)

!$acc update device (YD%FGTT_OC)

!$acc update device (YD%FGTT_OD)

!$acc update device (YD%FRS_K_SCAT0)

!$acc update device (YD%FRS_P_CRIT)

!$acc update device (YD%FRS_BETA)

!$acc update device (YD%RLAMB_SOLID)

!$acc update device (YD%RLAMB_WATER)

!$acc update device (YD%RMIXD)

!$acc update device (YD%RMIXP0)

END SUBROUTINE

END MODULE
