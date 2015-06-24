#!/usr/local/bin/bash
while read -r line
do
		rm -rf ~/.$line
done < symList.txt
