! Fortran, BLAS a LAPACK: řešení soustavy lineárních algebraických rovnic a následná zkouška
module mLinalg
implicit none
interface operator (.gesv.); module procedure w_dgesv; end interface
interface operator (.gemv.); module procedure w_dgemv; end interface
contains
function w_dgesv(A,b) result (x)                     ! wrapper pro dgesv
   real(8),intent(in) :: A(:,:),b(:)
   real(8) x(size(b))
   real(8),allocatable :: AA(:,:)
   integer,allocatable :: ipiv(:)
   integer n,info
   n=size(b); AA=A; x=b; ipiv=b
   call dgesv(n,1,AA,size(AA,1),ipiv,x,size(x),info) ! explicitní LAPACK
end function
function w_dgemv(A,b) result (r)                     ! wrapper pro dgemv
   real(8),intent(in) :: A(:,:),b(:)
   real(8) r(size(b))
   integer n
   n=size(b)
   call dgemv('N',n,n,1._8,A,n,b,1,0._8,r,1)         ! explicitní BLAS
end function
end module

use mLinalg
real(8),allocatable :: A(:,:),b(:),x(:)
character(20) :: format='(a,3f20.15)'
nmax=10000
allocate (A(nmax,nmax),b(nmax))
A=1._8/nmax; do n=1,nmax; A(n,n)=1; enddo  ! matice soustavy
b=1                                        ! vektor pravé strany
print format,'b =',b(1:3)
x=A.gesv.b                                 ! vektor řešení
print format,'x =',x(1:3)
b=A.gemv.x      ! nebo standardní fortranské b=matmul(A,x)
print format,'b =',b(1:3)
print format,'d =',sum(abs(b-1)),sqrt(sum((b-1)**2)),maxval(abs(b-1))  ! normy rozdílu b
end program
