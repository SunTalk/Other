@echo off

cls
type template.cpp > %1.cpp
echo.> %1.in
echo.> %1.out

echo %1 Created