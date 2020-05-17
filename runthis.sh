#!/bin/bash

if [ $# -eq 0 ]; then
	/usr/games/cowsay "This could be us, but playing with this Terraria 1.4.0.2 server.\
 Just enter the Terraria server parameters to the command line (type 'config' to use the\
 'terraria.cfg' file instead) or type 'bash' to get a shell. *burp*"
elif [ "$1" == "bash" ]; then
	/bin/bash -login
else
	# copy the default Terraria config file
	if [ ! -f /terraria/terraria.txt ]; then
		cp /serverconfig.txt /terraria/terraria.txt
	fi

	if [ "$1" == "config" ]; then
		/1402/Linux/TerrariaServer.bin.x86_64 -config /terraria/terraria.txt
	else
		/1402/Linux/TerrariaServer.bin.x86_64 "$@"
	fi

	# debug only
#	/bin/bash -login

fi
