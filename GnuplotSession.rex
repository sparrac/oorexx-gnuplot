::class GnuplotSession public

::method init

  parse source opsys . .
  self~iswindows = opsys~upper~abbrev('WINDOWS')

  self~gpbin  = 'gnuplot'
  self~isopen = .false

  if \ self~iswindows then do
    self~pipe   = self~getPipeName()
    self~stream = .Stream~new(self~pipe)
    end
  else do
    self~pipe   = .nil
    self~stream = .nil
    end

::method gpbin attribute
::method pipe attribute private
::method isopen attribute private
::method stream attribute private
::method iswindows attribute private

::method open
  if \ self~iswindows then do
    'mkfifo "' || self~pipe || '"'
    '"'self~gpbin'" -p < "'self~pipe'" &'
    self~stream~open("read")
    if rc = 0 then self~isopen = .true
    end
  else do
    gp = .OLEObject~New("wscript.shell")~exec(self~gpbin '-p')
    self~pipe = gp~stdin
    self~isopen = .true
    rc = 0
    end
  return rc

::method close
  self~command('quit')
  if \ self~iswindows then do
    self~stream~close
    ret = SysFileDelete(self~pipe)
    end
  else
    ret = 1

  return ret

::method uninit
  if self~isopen = .true then self~close
  
::method command

  if self~isopen = .false then self~open

  parse arg command
  if \ self~iswindows then do
    self~stream~charout(command '0a'x)
    self~stream~flush
    ret = result
    end
  else do  
    self~pipe~writeline(command)
    ret = 1
    end
  return ret

::method set
  parse arg command
  return self~command('set' command)

::method unset
  parse arg command
  return self~command('unset' command)

::method reset
  parse arg command
  return self~command('reset' command)

::method plot
  parse arg command
  return self~command('plot' command)

::method splot
  parse arg command
  return self~command('splot' command)

::method replot
  parse arg command
  return self~command('replot' command)

::method getPipeName private

  if self~iswindows then
    path = value('TEMP', , 'ENVIRONMENT') || '\'
  else
    path = ''

  return SysTempFileName(path || 'gnuplotfifo.???')
