#!/usr/bin/env rexx
-- simple_session.rex
-- Simple plotting with `GnuplotSession` class

g = .GnuplotSession~new
g~open

do i = 1 to 4
  g~command('plot sin('i'*x) title "' i '"')
  call SysSleep 1
end

g~command('plot exp(x)')
g~close

exit

::requires 'GnuplotSession'
