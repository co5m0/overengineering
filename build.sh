#!/bin/bash

MD_DIR=./markdown
for i in $(ls $MD_DIR | awk -F. '{print $1}'); do if [[ ! -d "$MD_DIR/$i" ]]; then echo "build $i"; pandoc --from markdown+smart+yaml_metadata_block -s $MD_DIR/$i.md  --template ./template.html --css=assets/base.css -o ./html/$i.html; fi; done
