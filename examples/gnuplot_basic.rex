#!/usr/bin/env rexx
-- gnuplot_basic.rex
-- Simple plotting with `Gnuplot` class

gp = .Gnuplot~new
gp~title  = 'Sine & Cosine Functions'
gp~grid   = 'xtics ytics'
gp~xlabel = 'X Axis'
gp~ylabel = 'Y Axis'

plot1 = gp~add('sin(x)')
plot1~title = 'Sine'
plot1~width = '2'
plot1~with = 'lines'

plot2 = gp~add('cos(x)')
plot2~title = 'Cosine'
plot2~width = '1'
plot2~with = 'points'

gp~plot

exit

::requires 'Gnuplot'
