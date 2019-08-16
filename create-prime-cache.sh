#!/bin/sh
if [ ! -f "$1" ]; then
    echo "First argument must be tectonic's manifest file"
    exit 1
fi

# ignore local files (represented by - in the third entry in the manifest)
awk '$3 != "-" {print "\\IfFileExists{"$1"}{}{}"}' "$1" > prime-cache.tex
echo '\\documentclass{article}\\begin{document}cache primed\\end{document}' >> prime-cache.tex
