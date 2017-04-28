#!/bin/bash

if [ $# -eq 0 ]; then
  /usr/games/cowsay "This could be us, but playing with this Terraria 1.3.5.3 server. Just enter a Terraria world name to the command line. *burp*" 
else
  # copy the default Terraris config file
	if [ ! -f /terraria/config.txt ]; then
     cp /config.txt /terraria
  fi

  # add the magic part to modify the Terraria config.txt
  # ...

  # start the server
	/1353/Linux/TerrariaServer.bin.x86_64 -config /terraria/config.txt

  # fall back to this shell (yet)
#  /bin/bash -login
    
fi
