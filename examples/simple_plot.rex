#!/usr/bin/env rexx
-- simple_plot.rex
-- Simple plotting with `Gnuplot` class

gp = .Gnuplot~new
gp~title  = 'Sine & Cosine Functions'
gp~grid   = 'xtics ytics'
gp~xlabel = 'X Axis'
gp~ylabel = 'Y Axis'

index1 = gp~add('sin(x)')
plot1 = gp~plots[index1]
plot1~title = 'Sine'
plot1~width = '2'
plot1~with = 'lines'

index2 = gp~add('cos(x)')
plot2 = gp~plots[index2]
plot2~title = 'Cosine'
plot2~width = '1'
plot2~with = 'points'

gp~plot

exit

::requires 'Gnuplot'
