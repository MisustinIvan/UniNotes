PROGRAM MAIN
    USE, INTRINSIC :: iso_fortran_env, ONLY: real64
    IMPLICIT NONE

    REAL(real64), PARAMETER :: AX = 1.0_real64, FX = 3.0_real64, PHX = 0.1_real64
    REAL(real64), PARAMETER :: AY = 1.0_real64, FY = 4.0_real64, PHY = 0.7_real64
    REAL(real64), PARAMETER :: AZ = 1.0_real64, FZ = 7.0_real64, PHZ = 0.1_real64

    REAL(real64), PARAMETER :: PI = 4.0_real64 * ATAN(1.0_real64)
    REAL(real64), PARAMETER :: T_MAX = 2.0_real64 * PI
    INTEGER, PARAMETER :: STEPS = 1000
    REAL(real64), PARAMETER :: STEP = T_MAX / STEPS

    CHARACTER(LEN=*), PARAMETER :: FILENAME = 'lissajous.dat'

    INTEGER :: f, n
    REAL(real64) :: point(3)

    OPEN(NEWUNIT=f, FILE=FILENAME)

    DO n = 0, STEPS
        point = Lissajous(n * STEP)
        WRITE(f, '(3(F14.10))') point
    END DO

    CLOSE(f)

CONTAINS

    PURE FUNCTION Lissajous(t) RESULT(pos)
        REAL(real64), INTENT(IN) :: t
        REAL(real64) :: pos(3)

        pos(1) = AX * SIN(FX * t + PHX)
        pos(2) = AY * SIN(FY * t + PHY)
        pos(3) = AZ * SIN(FZ * t + PHZ)
    END FUNCTION Lissajous

END PROGRAM MAIN
