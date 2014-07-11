	a=1

        integerValue=$1
        fractionalValue=$2
 	infileEnd="GHz.txt"
	outfileEnd="GHz.csv"

	while read line
	do           	
		currentline=$line
		if [ $a = "13" ]
		then 
			echo -e "Instance Cells Leakage-Power(nW) Dynamic-Power(nW) Total-Power(nW)" > sim_power_$integerValue.$fractionalValue$outfileEnd
		else
			echo -e "$currentline" >> sim_power_$integerValue.$fractionalValue$outfileEnd
		fi		
		let "a += 1"       
	done < sim_power_$integerValue.$fractionalValue$infileEnd

	echo "done"
