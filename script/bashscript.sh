#!/bin/bash
m=$1
t=$2
	mkdir -p design_runs/t$t/m$m 
	echo "Make dir complete"
	bash script/editfilescript.sh $m $t
	echo "Edit Bch.in complete"
	cp sources/* design_runs/t$t/m$m/  
	echo "Copy folder complete"
	cd design_runs/t$t/m$m/
	echo "Change dir complete"
	./bch_generate
	./test_vector_generate $1 $2
	rm bch_generate
	rm test_vector_generate
	rm *.vht
	rm *.in
	echo "Bch.exe complete"

