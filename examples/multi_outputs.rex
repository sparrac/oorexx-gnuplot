#!/usr/bin/env rexx
-- multi_outputs.rex
-- Creates 100 PNG files

parse arg opt
basename = 'output_'

if opt = 'clean' then do
  do i = 1 to 100
    rc = SysFileDelete(basename || right(i, 3, 0) || '.png')
  end
  exit
end

g = .GnuplotSession~new
g~open

g~set("terminal pngcairo size 800,800 font 'Verdana,10' rounded background '#ffffff'")
do i = 1 to 100
  out = basename || right(i, 3, 0) || '.png'
  g~set('output "' || out || '"')
  g~command('plot sin('i'*x) title "' i '"')
end

g~close

exit

::requires 'GnuplotSession'
