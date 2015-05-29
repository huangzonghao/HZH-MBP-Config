#!/usr/local/bin/bash
while read -r line
do
		ln -s ./dotfiles/$line ../.$line;
done < symList.txt
