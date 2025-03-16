#!/bin/bash

for i in $(ls ./markdown | awk -F. '{print $1}'); do echo "build $i"; pandoc --from gfm+smart+yaml_metadata_block -s ./markdown/$i.md  --template ./template.html --css=assets/base.css -o ./html/$i.html; done
