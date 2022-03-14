MODULE COPY_TPHY0_MOD

USE YOMPHY0, ONLY : TPHY0

INTERFACE COPY
MODULE PROCEDURE COPY_TPHY0
END INTERFACE

CONTAINS

SUBROUTINE COPY_TPHY0 (YD)

IMPLICIT NONE
TYPE (TPHY0), INTENT (IN) :: YD

!$acc update device (YD%TYM)

!$acc update device (YD%NPCLO1)

!$acc update device (YD%NPCLO2)

!$acc update device (YD%A0ML_AU)

!$acc update device (YD%A0ML_AT)

!$acc update device (YD%A0ML_BU)

!$acc update device (YD%A0ML_BT)

!$acc update device (YD%AERCS1)

!$acc update device (YD%AERCS3)

!$acc update device (YD%AERCS5)

!$acc update device (YD%ADJTAU)

!$acc update device (YD%ALMAV)

!$acc update device (YD%BEDIFV)

!$acc update device (YD%ECMNP)

!$acc update device (YD%EDB)

!$acc update device (YD%EDC)

!$acc update device (YD%EDD)

!$acc update device (YD%EVAP)

!$acc update device (YD%FONT)

!$acc update device (YD%GALP)

!$acc update device (YD%GCISMIN)

!$acc update device (YD%GEVAVF)

!$acc update device (YD%GCCSV)

!$acc update device (YD%GCVADS)

!$acc update device (YD%GCVBETA)

!$acc update device (YD%GCVIMPT)

!$acc update device (YD%GCVOMGE)

!$acc update device (YD%GCVOMGQ)

!$acc update device (YD%GCVOMGS)

!$acc update device (YD%GCVTURB)

!$acc update device (YD%GCVOMDPS)

!$acc update device (YD%GCVOMGSX)

!$acc update device (YD%GCVRHMIN)

!$acc update device (YD%GCVRHMAX)

!$acc update device (YD%GCVOMCA)

!$acc update device (YD%GCVOMCC)

!$acc update device (YD%GDDEVA)

!$acc update device (YD%GDDSDE)

!$acc update device (YD%GDDFREVS)

!$acc update device (YD%GDDINHOM)

!$acc update device (YD%GRCVPP)

!$acc update device (YD%GWDAMP)

!$acc update device (YD%GWDBC)

!$acc update device (YD%GWDCCO)

!$acc update device (YD%GWDCD)

!$acc update device (YD%GWDLT)

!$acc update device (YD%GWDSE)

!$acc update device (YD%GWDPROF)

!$acc update device (YD%GWDVALI)

!$acc update device (YD%HOBST)

!$acc update device (YD%HUCOE)

!$acc update device (YD%HUTIL)

!$acc update device (YD%HUTIL1)

!$acc update device (YD%HUTIL2)

!$acc update device (YD%QSMIN)

!$acc update device (YD%QSMODC)

!$acc update device (YD%QSNEBC)

!$acc update device (YD%QSNEBS)

!$acc update device (YD%QSSUSC)

!$acc update device (YD%QSSUSS)

!$acc update device (YD%QSSUSV)

!$acc update device (YD%QSUSXC)

!$acc update device (YD%QSUSXS)

!$acc update device (YD%RPHI0)

!$acc update device (YD%RPHIR)

!$acc update device (YD%QXRAL)

!$acc update device (YD%QXRAL_ADJ)

!$acc update device (YD%QXRDEL)

!$acc update device (YD%QXRHX)

!$acc update device (YD%QXRR)

!$acc update device (YD%QXRTGH)

!$acc update device (YD%QXRCDIL)

!$acc update device (YD%RCIN)

!$acc update device (YD%RCVEVAP)

!$acc update device (YD%RDECRD)

!$acc update device (YD%RDECRD1)

!$acc update device (YD%RDECRD2)

!$acc update device (YD%RDECRD3)

!$acc update device (YD%RDECRD4)

!$acc update device (YD%RDECRDRED)

!$acc update device (YD%RDTFAC)

!$acc update device (YD%REVAPN)

!$acc update device (YD%REVGSL)

!$acc update device (YD%RGELSFON)

!$acc update device (YD%RFLCHCE)

!$acc update device (YD%RTCAPE)

!$acc update device (YD%SCO)

!$acc update device (YD%SENSL)

!$acc update device (YD%SNNBCO)

!$acc update device (YD%SPNBCO)

!$acc update device (YD%SXNBCO)

!$acc update device (YD%TCA)

!$acc update device (YD%TCT)

!$acc update device (YD%TCW)

!$acc update device (YD%TENTR)

!$acc update device (YD%TENTRX)

!$acc update device (YD%TUDGP)

!$acc update device (YD%TDDGP)

!$acc update device (YD%TURB)

!$acc update device (YD%TVF)

!$acc update device (YD%UHDIFV)

!$acc update device (YD%USDMLT)

!$acc update device (YD%USUPRC)

!$acc update device (YD%USURIC)

!$acc update device (YD%VCHRNK)

!$acc update device (YD%VKARMN)

!$acc update device (YD%VZ0CM)

!$acc update device (YD%VZIUSTAR0)

!$acc update device (YD%XNBMAX)

!$acc update device (YD%AECLS3)

!$acc update device (YD%AECLS4)

!$acc update device (YD%ALD)

!$acc update device (YD%AKN)

!$acc update device (YD%ALPHAT)

!$acc update device (YD%ALPHAE)

!$acc update device (YD%EPS)

!$acc update device (YD%ETACUT)

!$acc update device (YD%ADISI)

!$acc update device (YD%ADISE)

!$acc update device (YD%ECTMIN)

!$acc update device (YD%ECTMAX)

!$acc update device (YD%AHCLPV)

!$acc update device (YD%RICRLM)

!$acc update device (YD%RMULACVG)

!$acc update device (YD%XBLM)

!$acc update device (YD%XMINLM)

!$acc update device (YD%XMAXLM)

!$acc update device (YD%XWSALM)

!$acc update device (YD%XWSBLM)

!$acc update device (YD%GCVALFA)

!$acc update device (YD%GCVPSI)

!$acc update device (YD%GCVPSIE)

!$acc update device (YD%USURICE)

!$acc update device (YD%USURICL)

!$acc update device (YD%QSSC)

!$acc update device (YD%USURID)

!$acc update device (YD%GCVNU)

!$acc update device (YD%USURIDE)

!$acc update device (YD%GCVMLT)

!$acc update device (YD%UTILGUST)

!$acc update device (YD%RRGAMMA)

!$acc update device (YD%RRSCALE)

!$acc update device (YD%GPBLHK0)

!$acc update device (YD%GPBLHRA)

!$acc update device (YD%WMXOV)

!$acc update device (YD%ACBRPHIM)

!$acc update device (YD%ALMAVE)

!$acc update device (YD%ALMAVX)

!$acc update device (YD%ARSCH)

!$acc update device (YD%ARSCQ)

!$acc update device (YD%ARSC1)

!$acc update device (YD%ARSB2)

!$acc update device (YD%RICRET)

!$acc update device (YD%STTBMIN)

!$acc update device (YD%UCWSTAR)

!$acc update device (YD%UDECT)

!$acc update device (YD%UPRETMIN)

!$acc update device (YD%UPRETMAX)

!$acc update device (YD%USHEARM)

!$acc update device (YD%RAUTEFR)

!$acc update device (YD%RRAUTCS)

!$acc update device (YD%RAUTEFS)

!$acc update device (YD%RAUTSBET)

!$acc update device (YD%REVASX)

!$acc update device (YD%RNINTR)

!$acc update device (YD%RNINTS)

!$acc update device (YD%RQLCR)

!$acc update device (YD%RSPCRR)

!$acc update device (YD%RQICRMAX)

!$acc update device (YD%RQICRMIN)

!$acc update device (YD%RQLCV)

!$acc update device (YD%RQICVMAX)

!$acc update device (YD%RQICVMIN)

!$acc update device (YD%RQICRT1)

!$acc update device (YD%RQICRT2)

!$acc update device (YD%RQICRSN)

!$acc update device (YD%RQCRNS)

!$acc update device (YD%RACCEF)

!$acc update device (YD%RAGGEF)

!$acc update device (YD%RRIMEF)

!$acc update device (YD%RHCRIT1)

!$acc update device (YD%RHCRIT2)

!$acc update device (YD%RETAMIN)

!$acc update device (YD%RFACNSM)

!$acc update device (YD%TFVL)

!$acc update device (YD%TFVI)

!$acc update device (YD%TFVR)

!$acc update device (YD%TFVS)

!$acc update device (YD%GRHCMOD)

!$acc update device (YD%RHCEXPDX)

!$acc update device (YD%NUPTKE)

!$acc update device (YD%TKEMULT)

!$acc update device (YD%C_EPSILON)

!$acc update device (YD%C3TKEFREE)

!$acc update device (YD%ETKE_CTHETA)

!$acc update device (YD%ETKE_RIFC_MAF)

!$acc update device (YD%ETKE_RIFC)

!$acc update device (YD%ETKE_R)

!$acc update device (YD%ETKE_OLAM)

!$acc update device (YD%ETKE_LAM0)

!$acc update device (YD%ETKE_LAM1)

!$acc update device (YD%ETKE_LAM2)

!$acc update device (YD%ETKE_LAM3)

!$acc update device (YD%ETKE_LAM4)

!$acc update device (YD%ETKE_KA1)

!$acc update device (YD%ETKE_KA2)

!$acc update device (YD%ETKE_KA3)

!$acc update device (YD%ENT_LAMBDA)

!$acc update device (YD%ETKE_CG01)

!$acc update device (YD%ETKE_CG02)

!$acc update device (YD%ETKE_CG03)

!$acc update device (YD%ETKE_BETA_EPS)

!$acc update device (YD%ETKE_GAMMA_EPS)

!$acc update device (YD%ETKE_GAMD)

!$acc update device (YD%ETKE_TALPH)

!$acc update device (YD%ETKE_ALPH0)

!$acc update device (YD%ETKE_ENTRX)

!$acc update device (YD%ETKE_ENTRN)

!$acc update device (YD%ETKE_KLM)

!$acc update device (YD%ETKE_TAULM)

!$acc update device (YD%ETKE_C0SHEAR)

!$acc update device (YD%ETKE_R1SIM)

!$acc update device (YD%ETKE_R2SIM)

!$acc update device (YD%ETKE_GB08A)

!$acc update device (YD%ETKE_GB08B)

!$acc update device (YD%ETKE_MIN)

!$acc update device (YD%ETKE_CRIT)

!$acc update device (YD%ETKE_DELTA)

!$acc update device (YD%EFB_AZ0)

!$acc update device (YD%EFB_UR)

!$acc update device (YD%REFB_1)

!$acc update device (YD%REFB_2)

!$acc update device (YD%REFB_3)

!$acc update device (YD%TUDBU)

!$acc update device (YD%TDDBU)

!$acc update device (YD%TUDFR)

!$acc update device (YD%TDDFR)

!$acc update device (YD%GCVALMX)

!$acc update device (YD%GCVTAUDE)

!$acc update device (YD%GCVACHI)

!$acc update device (YD%GCVBEE)

!$acc update device (YD%GCVEEX)

!$acc update device (YD%ECMNPI)

!$acc update device (YD%GRRMINA)

!$acc update device (YD%GDDBETA)

!$acc update device (YD%GDDDP)

!$acc update device (YD%GDDFXM)

!$acc update device (YD%GDDWPF)

!$acc update device (YD%GDDEVF)

!$acc update device (YD%TENTRD)

!$acc update device (YD%GDDALBU)

!$acc update device (YD%GDDFRAC)

!$acc update device (YD%GDDENDYMX)

!$acc update device (YD%GDDFP)

!$acc update device (YD%GDDTAUSIG)

!$acc update device (YD%GPEIPHI)

!$acc update device (YD%GPETAU)

!$acc update device (YD%GPEFDC)

!$acc update device (YD%GENVSRH)

!$acc update device (YD%GCVKSKV)

!$acc update device (YD%GCVALBU)

!$acc update device (YD%GCVENDY1)

!$acc update device (YD%GCVENDY2)

!$acc update device (YD%GCVENDYMX)

!$acc update device (YD%GCVIDPBAS)

!$acc update device (YD%GCVTAUSIG)

!$acc update device (YD%GTRGDPMIX)

!$acc update device (YD%GTRGDPHIMN)

!$acc update device (YD%GTRGPUSLMN)

!$acc update device (YD%GTRGKCK9)

!$acc update device (YD%GTRGAIN)

!$acc update device (YD%GTRTHRS)

!$acc update device (YD%GTRTHCK)

!$acc update device (YD%GTRBRC)

!$acc update device (YD%GTRKGAIN)

!$acc update device (YD%GTRKTHRS)

!$acc update device (YD%GTRKTHCK)

!$acc update device (YD%GCVCATAU)

!$acc update device (YD%GCATHRCAP)

!$acc update device (YD%GCATHRMOC)

!$acc update device (YD%GCATHRCND)

!$acc update device (YD%GCAOMCND)

!$acc update device (YD%NWEIGHT)

!$acc update device (YD%NCATAU)

!$acc update device (YD%NCAPEMAX)

!$acc update device (YD%NCVGMAX)

!$acc update device (YD%RNEGAT)

!$acc update device (YD%RNLCURV)

!$acc update device (YD%EDK)

!$acc update device (YD%XKLM)

!$acc update device (YD%AGRE1)

!$acc update device (YD%AGRERICR)

!$acc update device (YD%AJBUMIN)

!$acc update device (YD%RCOFLM)

!$acc update device (YD%TENTRVL)

!$acc update device (YD%TRENTRV)

!$acc update device (YD%GCVGAMMA)

!$acc update device (YD%LKESC)

!$acc update device (YD%AGRE2)

!$acc update device (YD%AGREF)

!$acc update device (YD%ALFX)

!$acc update device (YD%ALFX_LR)

!$acc update device (YD%ALFX_HR)

!$acc update device (YD%TCTC)

!$acc update device (YD%TVFC)

!$acc update device (YD%GAMAP1)

!$acc update device (YD%RKDN)

!$acc update device (YD%VVN)

!$acc update device (YD%VVX)

!$acc update device (YD%FENTRT)

!$acc update device (YD%FQLIC)

!$acc update device (YD%FNEBC)

!$acc update device (YD%FEVAPC)

!$acc update device (YD%RDPHIC)

!$acc update device (YD%RWBF1)

!$acc update device (YD%RWBF2)

!$acc update device (YD%SCLESPR)

!$acc update device (YD%SCLESPS)

!$acc update device (YD%HUCRED)

!$acc update device (YD%HUCREDRA)

!$acc update device (YD%FSPRAIN)

!$acc update device (YD%EFFCOLL)

!$acc update device (YD%RSMDNEBX)

!$acc update device (YD%RSMDTX)

!$acc update device (YD%NSMTPA)

!$acc update device (YD%NSMTPB)

!$acc update device (YD%RKFBTAU)

!$acc update device (YD%RKFBNBX)

!$acc update device (YD%GCVHMIN)

!$acc update device (YD%GCVRESN)

!$acc update device (YD%GCVRESX)

!$acc update device (YD%GMIRH)

!$acc update device (YD%RLMLH1)

!$acc update device (YD%RPRTH)

!$acc update device (YD%RSMOOTHMELT)

!$acc update device (YD%LADVLIM)

!$acc update device (YD%LGDDD)

!$acc update device (YD%LCVNHD)

!$acc update device (YD%LCVRESDYN)

!$acc update device (YD%LCVMICC)

!$acc update device (YD%GMUKEDD)

!$acc update device (YD%GNHDTAT)

!$acc update device (YD%GNHDSMOS)

!$acc update device (YD%GNHDSMOT)

!$acc update device (YD%GNHDEV)

!$acc update device (YD%LGVVEX)

!$acc update device (YD%LCVUVM)

!$acc update device (YD%NCVENTR)

!$acc update device (YD%NCVSIG)

!$acc update device (YD%NCVCLOS)

!$acc update device (YD%NCVQLI)

!$acc update device (YD%GCVENTRN)

!$acc update device (YD%GCVENTRX)

!$acc update device (YD%ADOE)

!$acc update device (YD%RFRAC_ENTR_N)

!$acc update device (YD%RFRAC_ENTR_X)

!$acc update device (YD%GCVENTR_MIN)

!$acc update device (YD%THPCMT)

!$acc update device (YD%AJ1PEPS)

!$acc update device (YD%AJ1MEPS)

!$acc update device (YD%NAJITER)

!$acc update device (YD%GAEPS)

!$acc update device (YD%GCVEZ)

!$acc update device (YD%GCVTRMIN)

!$acc update device (YD%LCVFEVV)

!$acc update device (YD%GCVFEVV)

!$acc update device (YD%LCVCONTAU)

!$acc update device (YD%GCVTEXC)

!$acc update device (YD%GCVWEXC)

!$acc update device (YD%LCVNAUV)

!$acc update device (YD%GCVFRR)

!$acc update device (YD%GCVPNH)

!$acc update device (YD%GCVORGED)

!$acc update device (YD%LCVIMPT)

!$acc update device (YD%GCVTAUREM)

!$acc update device (YD%GCLOEA)

!$acc update device (YD%GCLOEB)

!$acc update device (YD%GFRAE)

!$acc update device (YD%GCVADET)

!$acc update device (YD%GCVCINC)

!$acc update device (YD%GSDMIN)

!$acc update device (YD%GSDMAX)

!$acc update device (YD%GALMIN)

!$acc update device (YD%GALMAX)

!$acc update device (YD%GSDAMIN)

!$acc update device (YD%GSDAMAX)

!$acc update device (YD%GEXPKD)

!$acc update device (YD%LCVEOD)

!$acc update device (YD%GREMIN)

!$acc update device (YD%GREMAX)

!$acc update device (YD%GCHI0)

!$acc update device (YD%GFSURF)

!$acc update device (YD%GSHELL)

!$acc update device (YD%GFRIC)

!$acc update device (YD%GUDDD)

!$acc update device (YD%GSIGA)

!$acc update device (YD%GNHDSMOW)

!$acc update device (YD%GDEPTH)

!$acc update device (YD%GALTAU)

!$acc update device (YD%GKEDDRE)

!$acc update device (YD%GNHACC)

!$acc update device (YD%GTDCL)

!$acc update device (YD%GSINHD)

!$acc update device (YD%GSINHR)

!$acc update device (YD%GCVFNER)

!$acc update device (YD%GCVFNEO)

!$acc update device (YD%GCVFNEP1)

!$acc update device (YD%GCVFNEP2)

!$acc update device (YD%GRBCC)

!$acc update device (YD%GTOPDEPTH)

!$acc update device (YD%GCVTSMO)

!$acc update device (YD%RKDX)

!$acc update device (YD%LCAPCIN)

!$acc update device (YD%LCORSEDIM)

!$acc update device (YD%GNHDTAU)

!$acc update device (YD%GRSO)

!$acc update device (YD%GRTH)

!$acc update device (YD%GRFCS)

!$acc update device (YD%GCVRE)

!$acc update device (YD%LSBUO)

!$acc update device (YD%GREDDI)

!$acc update device (YD%GREDDL)

!$acc update device (YD%GREDDR)

!$acc update device (YD%GREDDS)

!$acc update device (YD%LCVTADV)

!$acc update device (YD%LCVDS)

!$acc update device (YD%GCVUV)

!$acc update device (YD%GCVGAW)

!$acc update device (YD%GCVGAX)

!$acc update device (YD%GCHECKMV_TMIN)

!$acc update device (YD%GCHECKMV_TMAX)

!$acc update device (YD%GCHECKMV_QVMIN)

!$acc update device (YD%GCHECKMV_QVMAX)

!$acc update device (YD%LGPRONI1)

!$acc update device (YD%NPRONI)

!$acc update device (YD%GPRONI)

!$acc update device (YD%RNEBCX)

!$acc update device (YD%REFLRHC)

!$acc update device (YD%TEQH)

!$acc update device (YD%REFLKUO)

!$acc update device (YD%REFLCAPE)

!$acc update device (YD%TEQK)

!$acc update device (YD%TEQC)

END SUBROUTINE

END MODULE
