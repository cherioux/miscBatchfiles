@echo off
color 0a
title Which Drive is This Batch file on?
echo This program shows what drive the batch file is on.
echo Copyright (C) Jacob McCloskey 2018 B015A
echo Ex. F:\ C:\ A:\ D:\ ect.
echo To use the variable that stores the drive letter, 
echo type precent-tilde-d-zero (percent ~ d 0)
echo.
echo This is the current drive letter:
echo %~d0
echo.
pause