#!/usr/bin/env rexx
-- session_explicit_multiplot.rex
-- Creates a multiplot

g = .GnuplotSession~new
g~open

g~set('xrange [-5:5]')
g~set('yrange [-5:5]')
g~set('multiplot layout 2,2 title "Powers of x"')
g~set('grid')
g~set('size square')

colors = ('red', 'blue', 'green', 'orange')

do i = 1 to 4
  g~set('title "f(x) = x^'i'"')
  g~plot('x**' || i 't "x^'i'" lw 2 lc "'colors[i]'"')
end

g~unset('multiplot')

g~close


::requires 'GnuplotSession'
