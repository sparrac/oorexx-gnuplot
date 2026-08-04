#!/usr/bin/env rexx
-- session_dynamic_3D.rex

gp = .GnuplotSession~new~~open

gp~hidden3d   = ''
gp~pm3d       = ''
gp~isosamples = '35, 35'
gp~title      = '"Animated surface"'
gp~key        = .nil
gp~tics       = .nil

gp~splot('[-4:4][-4:4] sin(sqrt(x**2 + y**2)) / sqrt(x**2 + y**2) with pm3d')

do az = 0 to 90 by 3
  gp~view = '60,' || az
  gp~replot
  gp~pause(0.1)
end

do ax = 60 to 180 by 3
  gp~view = ax',' || az
  gp~replot
  gp~pause(0.1)
end

gp~close

exit

::requires 'GnuplotSession'
