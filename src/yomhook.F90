module yomhook
use parkind1, only : jprb
implicit none
logical :: lhook=.false.
!$ACC DECLARE CREATE(lhook)
contains
subroutine dr_hook(cdstr,ki,phook)
  character(len=*) :: cdstr
	integer :: ki
	real(kind=jprb) :: phook
!$ACC ROUTINE SEQ
end subroutine dr_hook
end module
