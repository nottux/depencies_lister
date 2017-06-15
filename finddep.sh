#!/bin/sh
echo enter .deb file/files location
read v
cd $v
echo choosed $(pwd) directory contains:
echo
ls *.deb
echo
echo debian packages
echo "if you don't want to continue do ctrl+c"
echo "are you want to write stdout to a file? (yes/no)"
read v
if [ $v = y -o $v = Y -o $v = Yes -o $v = yes -o $v = YES ]; then echo enter the file name; read c; a=" > "; b=u; else b=d; fi
if [ $v = n -o $v = N -o $v = No -o $v = no -o $v = NO ]; then b=u; fi
if [ $b = "d" ]; then echo wrong entry, ending; exit; fi
echo "are you want package name placed beginning to its depencies list? (yes/no)"
read v
if [ $v = y -o $v = Y -o $v = Yes -o $v = yes -o $v = YES ]; then j="echo {}; "; b=u; else b=d; fi
if [ $v = n -o $v = N -o $v = No -o $v = no -o $v = NO ]; then b=u; x=" | xargs"; fi
if [ $b = "d" ]; then echo wrong entry, ending; exit; fi
eval "find *.deb -exec sh -c '$j\ar p {} control.tar.gz | tar zx -O | grep Depends | cut -c 9- | tr -d ","' \;$x$a$c"
