@echo off

set /a one=%random%%%10+1
set /a two=%random%%%10+1
set /a three=%random%%%10+1

if %one% leq %two% (
	goto oo
) else goto ox

:oo
if %one% leq %three% (
	echo.
	echo doing one
	echo.
	one.bat %one%
	goto end
)

:ox
if %two% leq %one% (
	goto to
) else goto tx

:to
if %two% leq %three% (
	echo.
	echo doing two
	echo.
	two.bat %two%
	goto end
)

:tx
if %three% leq %one% (
	echo.
	echo doing two
	echo.
	three.bat %three%
	goto end
)

:end
