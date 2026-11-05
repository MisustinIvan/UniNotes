PROGRAM MAIN
IMPLICIT NONE

real(8) pi, piEuler
real(8) z,rn
integer(8) nmax, n
character(100) :: format='(a25,f20.15)'

pi=atan(1._8)*4
print format, 'pulnocni pi = ',pi

nmax = 1000000000
piEuler = 0
do n = nmax,1,-1
    rn = n;
    piEuler = piEuler + 1/(rn*rn)
end do
piEuler = sqrt(piEuler*6)
print format, 'pi podle euler = ',piEuler

END PROGRAM MAIN
