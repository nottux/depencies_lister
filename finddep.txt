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
if [[ $v = @(y|Y|Yes|yes|YES) ]]; then echo enter the file name; read c; a=" > "; b=u; else b=d; fi
if [[ $v = @(n|N|No|NO|no) ]]; then b=u; fi
if [ $b = "d" ]; then echo wrong entry, ending; exit; fi
echo "are you want package name placed beginning to its depencies list? (yes/no)"
read v
if [[ $v = @(y|Y|Yes|yes|YES) ]]; then j="echo {}; "; b=u; else b=d; fi
if [[ $v = @(n|N|No|NO|no) ]]; then b=u; x=" | xargs"; fi
if [ $b = "d" ]; then echo wrong entry, ending; exit; fi
#find *.deb -exec sh -c 'ar p {} control.tar.gz | tar zx -O | grep Depends | tr -d "Depends:,"' \; | xargs > depency.txt
eval "find *.deb -exec sh -c '$j\ar p {} control.tar.gz | tar zx -O | grep Depends | tr -d "Depends:,"' \;$x$a$c"
