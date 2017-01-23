#!/bin/sh
#This is .bashrc script - Alternative 2

invoke_liotad()
{
	echo "I0T!India2" | sudo -s -n python /etc/liota/packages/liotad.py & > /dev/null
	echo "liotad invoked"
}

invoke_autostart()
{
	echo "I0T!India2" | sudo -s -n python /etc/liota/packages/autostart.py > /dev/null
	echo "packages loaded"
}

linecount=0
#while true
#do
	if [ -d /etc/liota ]
	then
	    ps aux | egrep "python /etc/liota/packages/liotad.py|python liotad.py" |
	    {
		while IFS= read -r line
		do
		    linecount=$((linecount + 1))
		done

		if [ $linecount -ge 3 ] 
		then
			echo "Liota already running"
		else
			echo "Invoke liotad"
			invoke_liotad
			invoke_autostart
			exit
		fi
	    }
	fi
#done
