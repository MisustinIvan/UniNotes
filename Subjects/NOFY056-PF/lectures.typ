#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@local/mod:0.1.0": *

#show: boilerplate

#title[Programování pro fyziky - přednáška - Ladislav Hanyk]

= Předáška 1.
= Předáška 2.
implementace algoritmu pro výpočet následujících výrazů

$
  S_n = sum_(i=1)^n i; sq H_n = sum_(i=1)^n 1/i\
$

Implementace v pythonu v *./class_work/lecture_2_programs_python/main.py*
Implementace v fortranu v *./class_work/lecture_2_programs_fortran/main.F90*

= Přednáška 3.

= Přednáška 4.
== Real-valued increments in iteration
- beware of float precision...

== Map-Filter-Reduce
- pythons functional programming constructs

- numpy implements operator overloading for array access with bool-valued arrays

#{
  ```py
  def filter_odd(n):
      arr = np.arange(n)
      mask = arr%2 != 0 # mask - bool-value array
      res = arr[mask] # operator overloading - array access with a mask - filters out elements
  ```
}

= Přednáška 5
