#!/bin/bash

# for debugging only
if [ "$1" == "bash" ]; then
	/bin/bash -login
else

	# copy the default Terraria config file if it's not already there
	if [ ! -f /terraria/terraria.txt ]; then
		cp /serverconfig.txt /terraria/terraria.txt
	fi

	# if env variable "STARTMODE" is missing, we do it the old way, to remain compatibility
	if [ -z "$STARTMODE" ]; then 

		if [ $# -eq 0 ]; then
			/usr/games/cowsay "This could be us, but playing with this Terraria 1.4.5.5 PC server\
			or the 1.4.5.4 MOBILE version, but you did something wrong.\
			Just enter the Terraria server parameters to the command line (type 'config' to use the\
			'terraria.cfg' file instead) or type 'bash' to get a shell. *burp*\
			Also check the new startup method via the STARTMODE environment variable.\
			That's especially useful for Synology NASs. Good luck!"
		else

			if [ "$1" == "config" ]; then
				echo "STARTING PC SERVER WITH CONFIG"
				/1455/Linux/TerrariaServer.bin.x86_64 -config /terraria/terraria.txt
			else
				echo "STARTING PC SERVER"
				/1455/Linux/TerrariaServer.bin.x86_64 "$@"
			fi

		fi
	
	# the new start up method via env variables
	else
		if [ "$STARTMODE" = "MOBILE" ]; then
			echo "STARTING MOBILE SERVER VIA VARIABLE"
			/ServerLinux/TerrariaServer.bin.x86_64 -config /terraria/terraria.txt "$@"
		elif [ "$STARTMODE" = "PC" ]; then
			echo "STARTING PC SERVER VIA VARIABLE"
			/1455/Linux/TerrariaServer.bin.x86_64 -config /terraria/terraria.txt "$@"
		elif [ "$STARTMODE" = "BASH" ]; then
			echo "STARTING BASH VIA VARIABLE"
			/bin/bash -login
		else
			/usr/games/cowsay "Meh, unknown STARTMODE variable content: {$STARTMODE}"
		fi

	fi

fi
