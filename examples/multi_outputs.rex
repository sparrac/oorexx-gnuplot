#!/usr/bin/env rexx
-- multi_outputs.rex
-- Creates 100 PNG files

g = .GnuplotSession~new
g~open

basename = 'output_'

g~set("terminal pngcairo size 800,800 font 'Verdana,10' rounded background '#ffffff'")
do i = 1 to 100
  out = basename || right(i, 3, 0) || '.png'
  g~set('output "' || out || '"')
  g~command('plot sin('i'*x) title "' i '"')
end

g~close

exit

::requires 'GnuplotSession'
