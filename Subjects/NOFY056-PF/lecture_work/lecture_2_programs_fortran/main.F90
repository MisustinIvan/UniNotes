PROGRAM MAIN

REAL(8) s
INTEGER(8) n, si

n = 1000000000_8
i = 0; s = 0


do while(i<=n)
s = s + i
i = i + 1
end do

print *,'iterace s do while n,s = ',n,s

s=0
do j=1,n
s = s+j
end do

print *,'iterace s do n,s = ',n,s


END PROGRAM MAIN
