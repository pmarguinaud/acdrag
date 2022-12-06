INTERFACE
SUBROUTINE WRAP_ACDRAG (YDCST, YDML_PHY_MF,KIDIA,KFDIA,KLON,KTDIA,KLEV,&
 & PAPRS,PAPRSF,PDELP,PNBVNO,PRDELP,PU,PV,&
 & PRCORI,PGETRL,PGWDCS,PVRLAN,PVRLDI,&
 & PSTRDU,PSTRDV,PRAPTRAJ) 
USE MODEL_PHYSICS_MF_MOD , ONLY : MODEL_PHYSICS_MF_TYPE
USE PARKIND1 ,ONLY : JPIM ,JPRB ,JPRD
USE YOMCST , ONLY : TCST
USE SAVE_TCST_MOD
USE SAVE_MODEL_PHYSICS_MF_TYPE_MOD
TYPE(TCST), INTENT(IN) :: YDCST
TYPE(MODEL_PHYSICS_MF_TYPE),INTENT(IN):: YDML_PHY_MF
INTEGER(KIND=JPIM),INTENT(IN) :: KLON
INTEGER(KIND=JPIM),INTENT(IN) :: KLEV
INTEGER(KIND=JPIM),INTENT(IN) :: KIDIA
INTEGER(KIND=JPIM),INTENT(IN) :: KFDIA
INTEGER(KIND=JPIM),INTENT(IN) :: KTDIA
REAL(KIND=JPRB) ,INTENT(IN) :: PAPRS(KLON,0:KLEV)
REAL(KIND=JPRB) ,INTENT(IN) :: PAPRSF(KLON,KLEV)
REAL(KIND=JPRB) ,INTENT(IN) :: PDELP(KLON,KLEV)
REAL(KIND=JPRB) ,INTENT(IN) :: PNBVNO(KLON,0:KLEV)
REAL(KIND=JPRB) ,INTENT(IN) :: PRDELP(KLON,KLEV)
REAL(KIND=JPRB) ,INTENT(IN) :: PU(KLON,KLEV)
REAL(KIND=JPRB) ,INTENT(IN) :: PV(KLON,KLEV)
REAL(KIND=JPRB) ,INTENT(IN) :: PRCORI(KLON)
REAL(KIND=JPRB) ,INTENT(IN) :: PGETRL(KLON)
REAL(KIND=JPRB) ,INTENT(IN) :: PGWDCS(KLON)
REAL(KIND=JPRB) ,INTENT(IN) :: PVRLAN(KLON)
REAL(KIND=JPRB) ,INTENT(IN) :: PVRLDI(KLON)
REAL(KIND=JPRB) ,INTENT(OUT) :: PSTRDU(KLON,0:KLEV)
REAL(KIND=JPRB) ,INTENT(OUT) :: PSTRDV(KLON,0:KLEV)
REAL(KIND=JPRB) ,INTENT(OUT) :: PRAPTRAJ(KLON,0:KLEV)
END SUBROUTINE
END INTERFACE
