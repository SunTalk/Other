@echo off

cls
echo COMPILING...
g++ %1.cpp -o %1.exe -DDBG

echo FINISH
if %ERRORLEVEL% EQU 0 (
	%1.exe
)