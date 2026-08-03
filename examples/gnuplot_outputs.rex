#!/usr/bin/env rexx
-- gnuplot_outputs.rex
-- Creates three different files for the same plot

parse arg opt

outputs = ('output.png',,
           'output.svg',,
           'output.pdf')

if opt = 'clean' then do
  do o over outputs
    rc = SysFileDelete(o)
  end
  exit
end

gp = .Gnuplot~new
gp~title  = 'Quadratic function'
gp~grid   = 'xtics ytics'
gp~xlabel = 'X'
gp~ylabel = 'Y'
p = gp~add('x**2')
p~title = 'x²'
p~width = '1'
p~with  = 'lines'

do o over outputs
  gp~output = o
  gp~plot
end

exit

::requires 'Gnuplot'
