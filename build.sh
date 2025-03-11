#!/bin/bash


for i in $(ls ./markdown | awk -F. '{print $1}'); do echo "build $i"; pandoc -s ./markdown/$i.md --template ./template.html -o ./html/$i.html; done
