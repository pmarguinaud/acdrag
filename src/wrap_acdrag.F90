PROGRAM WRAP_ACDRAG
  
IMPLICIT NONE
  
TYPE STACK
  INTEGER*8 :: L, U
END TYPE

TYPE(STACK) :: YLSTACK
REAL(KIND=8), ALLOCATABLE :: ZSTACK (:, :)

ALLOCATE (ZSTACK (32,10))
  
PRINT *, " With data create "

!$acc data create (ZSTACK) 
!$acc serial create (YLSTACK)
YLSTACK%L = LOC (ZSTACK (1, 1))
CALL ACDRAG_SCC (YLSTACK)
!$acc end serial
!$acc end data

PRINT *, " With enter data create "

!$acc enter data create (ZSTACK)
!$acc serial create (YLSTACK) 
YLSTACK%L = LOC (ZSTACK (1, 1))
CALL ACDRAG_SCC (YLSTACK)
!$acc end serial
!$acc exit data delete (ZSTACK)

CONTAINS

SUBROUTINE ACDRAG_SCC (YDSTACK)
!$acc routine vector
    
IMPLICIT NONE
TYPE(STACK), INTENT(IN) :: YDSTACK

POINTER (IP, ZZ )
REAL*8 :: ZZ (10)

IP = YDSTACK%L

ZZ (1:10) = 3.14

END SUBROUTINE ACDRAG_SCC
  
END PROGRAM WRAP_ACDRAG
