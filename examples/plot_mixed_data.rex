#!/usr/bin/env rexx
-- plot_mixed_data.rex
-- How to plot from Arrays and Strings

gp = .Gnuplot~new
gp~title  = 'Data'
gp~grid   = 'xtics ytics'
gp~xlabel = 'X'
gp~ylabel = 'Y'
gp~debug = .true

-- From Arrays

xdata = .Array~of(1, 2, 3, 4, 5)
ydata = .Array~of(1, 4, 9, 16, 25)

i = gp~add(xdata, ydata)
p = gp~plots[i]
p~title = 'From Arrays'
p~width = '2'
p~with  = 'points'

-- From String (function)

i = gp~add('x**2')
p = gp~plots[i]
p~title = 'Function'
p~width = '1'
p~with  = 'lines'

gp~plot

exit

::requires 'Gnuplot'
