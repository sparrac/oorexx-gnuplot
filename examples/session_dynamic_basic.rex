#!/usr/bin/env rexx
-- session_dynamic_basic.rex
-- Dynamic command execution using ooRexx's `unknown` method.
-- Unhandled properties and methods are automatically mapped
-- to Gnuplot commands.

gp = .GnuplotSession~new~~open

gp~xrange = '[-7:pi]'  -- 'set xrange [-7:pi]'
gp~title  = '"sin(x)"' -- 'set title "sin(x)"'
gp~grid   = ''         -- 'set grid'
gp~size   = 'square'   -- 'set size square'
                       

gp~plot('sin(x)')

gp~pause(3)           -- 'pause 3'

gp~xrange = .nil      -- 'unset xrange'
gp~title  = .nil      -- 'unset title'

gp~plot('cos(x)')

gp~close

exit

::requires 'GnuplotSession'
