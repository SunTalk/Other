@echo off

cls
echo COMPILEING...
g++ %1.cpp -o %1.exe -DDBG

echo FINISH
if %ERRORLEVEL% EQU 0 (
	%1.exe
)