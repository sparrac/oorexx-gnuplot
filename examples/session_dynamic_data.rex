#!/usr/bin/env rexx
-- session_dynamic_data.rex
-- Method `data`

gp = .GnuplotSession~new~~open

gp~grid  = ''
gp~size  = 'square'

gp~multiplot = 'layout 1, 3 title "GnuplotSession: data method"'

-- Two arrays

x = (1, 2, 3, 4, 5)
y = (1, 4, 9, 16, 25)
gp~plot(gp~data(x, y) 'with linespoints lw 2 t "From two arrays"' )

-- A matrix

mat = ((1, 2), (2, 4), (3, 6), (4, 8), (5, 10))
gp~plot(gp~data(mat) 'with lines lw 2 t "From a matrix"' )

-- A string

str = '1 5'  || .endofline || -
      '2 3'  || .endofline || -
      '3 4'  || .endofline || -
      '4 10' || .endofline || -
      '5 1'

gp~plot(gp~data(str) 'with points pt 7 t "From a string"' )

gp~multiplot = .nil

gp~close

exit

::requires 'GnuplotSession'
