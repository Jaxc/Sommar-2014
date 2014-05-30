	a=1
	while read line
	do           	
		
		currentline=$line

		

		if [ $a == "2" ]
		then
			len=${#currentline}
			currentline=${currentline:0:2}$1${currentline:3:len}
		fi

		if [ $a == "3" ]
		then
			len=${#currentline}
			currentline=${currentline:0:2}$2${currentline:3:len}
		fi

		if [ $a = "2" ]
		then 
			echo -e "$currentline" > sources/bch.in
		else
			echo -e "$currentline" >> sources/bch.in
		fi		
		let "a += 1"       
	done sources/bchbasis.in

	echo "done"
