#!/usr/bin/env rexx
-- session_dynamic_fit.rex
-- Curve fitting using Gnuplot's `fit` command

gp = .GnuplotSession~new~~open

-- Data
x = (1, 2, 3, 4, 5)
y = (2.1, 3.9, 6.2, 7.8, 10.1)

db = gp~data(x, y)

gp~command('f(x) = a * x + b')
gp~command('a = 1; b = 1')

gp~fit('f(x)' db 'via a, b')

gp~plot(db 'with points pt 7 t "Data", f(x) with lines lw 2 t "Fit"' )

gp~close

exit

::requires 'GnuplotSession'
