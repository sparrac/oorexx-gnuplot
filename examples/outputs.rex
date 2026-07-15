#!/usr/bin/env rexx
-- outputs.rex
-- Creates three different files for the same plot

gp = .Gnuplot~new
gp~title  = 'Quadratic function'
gp~grid   = 'xtics ytics'
gp~xlabel = 'X'
gp~ylabel = 'Y'
i = gp~add('x**2')
p = gp~plots[i]
p~title = 'x²'
p~width = '1'
p~with  = 'lines'

outputs = ('output.png',,
           'output.svg',,
           'output.pdf')

do o over outputs
  gp~output = o
  gp~plot
end

exit

::requires 'Gnuplot'
