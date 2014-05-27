#!/bin/bash
m=6
t=1
	mkdir -p design_runs/t$t/m$m 
	echo "Make dir complete"
	bash script/editfilescript.sh $m $t
	echo "Edit Bch.in complete"
	cp sources/* design_runs/t$t/m$m/  
	echo "Copy folder complete"
	cd design_runs/t$t/m$m/
	echo "Change dir complete"
	gcc -o bch_generate bch.c
	pwd
	./bch_generate
	rm bch_generate
	echo "Bch.exe complete"

