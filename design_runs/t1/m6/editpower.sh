	a=13

        integerValue=$1
        fractionalValue=$2
 	infileEnd="GHz.txt"
	outfileEnd="GHz.csv"
	
	cd ../design_runs/

	while read line
	do           	
		
		if [ $a = "13" ]
		then 
			echo -e "Instance, Leakage Cells Power(nW), Dynamic Power(nW), Total Power(nW)" > sim_power_$integerValue.$fractionalValue$outfileEnd
		else
			echo -e "$currentline" >> sim_power_$integerValue.$fractionalValue$outfileEnd
		fi		
		let "a += 1"       
	done < sim_power_$integerValue.$fractionalValue$infileEnd

	echo "done"
