PROGRAM MAIN
    USE, INTRINSIC :: iso_fortran_env, ONLY: int32, int64, real128
    IMPLICIT NONE

    REAL(real128), ALLOCATABLE :: matrix(:,:)
    INTEGER(int32) :: n

    DO n = 1, 17
        matrix = inverse_hilbert(n)
        PRINT '(A, I2, A, F10.1)', "n = ", n, "  sum = ", SUM(matrix)
        DEALLOCATE(matrix)
    END DO

CONTAINS

    ! (n k) = n!/(k! (n-k)!)
    PURE FUNCTION binom(n,k) result(res)
        INTEGER(int32), INTENT(IN) :: n,k
        INTEGER(real128) :: res
        INTEGER(real128) :: i, nominator, denominator

        nominator = 1
        DO i = 1_int32, n
            nominator = nominator * i
        END DO

        denominator = 1
        DO i = 1_int32, k
            denominator = denominator * i
        END DO

        DO i = 1_int32, n - k
            denominator = denominator * i
        END DO

        res = nominator/denominator
    END FUNCTION binom

    PURE FUNCTION inverse_hilbert(n) RESULT(m)
        INTEGER(int32), INTENT(IN) :: n
        REAL(real128), ALLOCATABLE :: m(:,:)
        REAL(real128) :: sign
        INTEGER(int32) :: i, j

        ALLOCATE(m(n, n))

        DO j = 1, n
            DO i = 1, n
                IF (MODULO(i + j, 2) == 0) THEN
                    sign = 1.0_real128
                ELSE
                    sign = -1.0_real128
                END IF

                m(i, j) = sign * REAL(i + j - 1, real128) * binom(n + i - 1, n - j) * binom(n + j - 1, n - i) * binom(i + j - 2, i - 1)**2
            END DO
        END DO
    END FUNCTION inverse_hilbert

END PROGRAM MAIN
