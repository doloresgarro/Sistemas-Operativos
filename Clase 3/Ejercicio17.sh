#!/bin/bash 

for archivo in *; do
	if [ -f $file  ]; then
		echo "$file" | tr 'a-zA-z' 'A-Za-z' | tr -d 'Aa'
	fi
done
