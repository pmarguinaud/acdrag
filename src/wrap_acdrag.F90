PROGRAM WRAP_ACDRAG
!SUBROUTINE WRAP_ACDRAG ()
  
  USE acdrag_SCC_MOD, ONLY: acdrag_SCC
  USE stack_mod
  
  IMPLICIT NONE
  
  TYPE(STACK) :: YLSTACK
  REAL(KIND=8), ALLOCATABLE :: ZSTACK (:, :)
  INTEGER :: I

  ALLOCATE (ZSTACK (32,10))
  
!!$ACC DATA CREATE(ZSTACK ) 
!$ACC ENTER DATA CREATE(ZSTACK )

#ifdef _MPI
  start_time = MPI_WTime()
#endif

!$acc parallel loop gang default(present) private(YLSTACK)
  DO I=1, 10
    
    YLSTACK%L = LOC(ZSTACK (1, I))
    YLSTACK%U = YLSTACK%L + 32*8

    CALL ACDRAG_SCC (YLSTACK)
    
  END DO
!$acc end parallel loop
  
END PROGRAM WRAP_ACDRAG
