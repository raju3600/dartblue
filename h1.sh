#!/bin/bash

a= git branch -r

for i in  ( $a ); do

       	git checkout -b $i 

	gid add . 

	git commit -a -m "change commit" 

	git push origin $i 
done
