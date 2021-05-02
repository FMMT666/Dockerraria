Dockerraria
===========

Just another [Terraria server for Docker][1]  
Supports the PC and the MOBILE version.  

---

A plain and simple Terraria server in a Docker container.  
Can also be deployed in a Synology NAS (Intel CPUs only).

Actually, that's what I created it for :)

---
## WARNING WARNING WARNING

Make sure to specify different save locations for the PC and Mobile versions!  
The worlds are not compatible.

> BACKUP YOUR DATA

---
## STATUS 2021/04/30:

  Terraria server 1.4.2.2  PC  
  Terraria server 1.4.0.5  MOBILE  


---
## NEWS:

### CHANGES 2021/05/02:

    - fixed bug: Terraria config file was ignored with new startup control
    - added some notes for desktop computers

### CHANGES 2021/04/30:

    - updated for Terraria 1.4.2.2 release

### CHANGES 2020/11/26:

    - added a server for the MOBILE version 1.4.0.5
    - added startup control via environment variables

### CHANGES 2020/11/11:

    - updated for Terraria 1.4.1.2 release

### CHANGES 2020/10/27:

    - updated for Terraria 1.4.1.1 release

### CHANGES 2020/06/09:

    - updated for Terraria 1.4.0.5 release
    - updated serverconfig.txt

### CHANGES 2020/05/23:

    - updated for Terraria 1.4.0.4 release lol
    - updated for Terraria 1.4.0.3 release
    - added Journey's End template variables to serverconfig.txt

### CHANGES 2020/05/18:

    - updated for Terraria 1.4.0.2 release
      Tested with new and updating several 1.3 worlds. Seems to work fine.  
      Anyway, creating a backup of your worlds or picking a different mounting directory is recommended.  
      "Just in case" [tm]

### CHANGES 2017/09/20:

    - renamed the Github and Docker hub repos to sth - well, "meaningful"

### CHANGES 2017/04/30:

    - major cleanup
    - Terraria server configuration file not enabled by default
    - added 'bash' option

### CHANGES 2017/04/15:

    - added a cow
    - added automated build from Docker Hub

### CHANGES 2017/04/05:

    - initial version


---
## SOME NOTES

### Mobile Devices

Notice that the Mobile devices need to connect via the "Online" button and not "Local".
Just add the local IP address of your server or Synology NAS.

### Port Forwarding

As long as you are on the same local network, nothing else is required and there is no
need to open or forward ports in your (Internet) router.  
This is only required if you want to connect to your "server at home" from anywhere in
the world.

In this special case, it's usually required to forward the external port 7777 to port 7777
of your local server's or Synology's IP address.

Please consult the manual of your router on how to do this.  
It's not hard to do, but also might expose your network to some security risk if you don't
know what you're doing. If in doubt, don't do it.

As an alternative and if you are the only one playing on your server or Synology, an OpenVPN
connection with certificate is a much better option.

---
## INSTALLATION

### Read this first

As of 26.11.2020, a new startup mode selection via environment variables was build in.  
These can either be set with "-e" added to the the Docker "run" command, e.g.

    docker run --rm -it -p 7777:7777 -e STARTMODE=MOBILE fmmt666/dockerraria
    docker run --rm -it -p 7777:7777 -e STARTMODE=PC fmmt666/dockerraria

or in the Synology "Environment" tab, e.g.:

     Variable    | Value
    -------------+-------------
     STARTMODE   | MOBILE

For now, the following variables are supported:

    STARTMODE set to
      PC     -> Start server in PC mode
      MOBILE -> Start server in MOBILE mode
      BASH   -> Login and run bash. For debugging only.

If STARTMODE is not defined, Dockerraria will run in the "old" compatibility mode.  
This is documented below.

> IT IS HIGHLY RECOMMENDED TO USE DIFFERENT VOLUMES FOR THE PC AND THE MOBILE VERSION!  
> THE TWO VARIANTS ARE NOT COMPATIBLE AND MIGHT DESTROY YOUR WORLD FILES.  

> BACKUP YOUR DATA BEFORE CHANGING THE START MODES!  
> BACKUP YOUR DATA BEFORE CHANGING THE START MODES!  
> BACKUP YOUR DATA BEFORE CHANGING THE START MODES!  

### Synology, first installation

  - Inside the Docker app, go to "Registry" and search for "fmmt666/dockerraria".
  - Fetch the image by either a double clicking or right-click and selecting "download image".
  - Go to the "Container" tab, highlight the downloaded image and click "Start".
  - Click on "advanced settings" at the bottom.
  - In tab "Volume" click "Add Folder" and select the place where the worlds shall be stored,
    e.g. "/docker/terraria" or "/docker/mobileterraria" and enter the mount path "/terraria".
    Notice: Do _not_ change the mount path. This must be "/terraria".
  - In "Port-Settings" enter local port "7777" and container port "7777".

As of 11/2020, it is recommended to use the new startup method via environment variables:

  - In the "Environment" tab, add a "STARTMODE" variable and set its value to either "PC"
    or "MOBILE", depending on which server you want to start. All in capital letters.

For the old method and only for the PC variant (not necessary if you already set the STARTMODE
variable above):
  - In the "Environment" tab, enter "config" in the "Execution Command" field at the bottom.


Start the container.  

After a while, go to "Container" and the "Details" of the running container and follow the
instructions in the "Terminal" tab.

    Warning: The Synology web app tends to crash (at least Firefox),
    while the world is generated. Those hundreds of lines with server
    messages is just too much for this GHz CPU, lol...
    One solution is to quickly leave the "Terminal" tab, after initiating the world building process
    and come back after 3..4 minutes.

### Synology, update

  - Inside the Docker app, go to "Container", "fmmt666-dockerraria" and stop it, in case it's running
  - Go to "Registry" and search for "fmmt666/dockerraria".
  - Fetch the new image by either a double clicking or right-click and selecting "download image".
  - Wait until the download completes. Important!
  - Go to the "Container" tab, right click the existing "Dockerraria" entry and select "Settings", "Duplicate Settings"
  - Enter a name to identify the new container
  - Right click on the *old* container again and select "Edit"
  - In the tab "Port Settings", either delete or change the "Local Port" value to something different than "7777"
  - Right click on the *new* container and as you just did before, change the local port to "7777"
  - done


### Linux/macOS/Windows

Get the Docker image from the Docker hub:

    docker pull fmmt666/dockerraria

Quick test, notice that the generated world will not be saved:

    docker run --rm -it -p 7777:7777 -e STARTMODE=PC     fmmt666/dockerraria
    docker run --rm -it -p 7777:7777 -e STARTMODE=MOBILE fmmt666/dockerraria

Or with the "old" method:

    docker run --rm -it -p 7777:7777 fmmt666/dockerraria config

And follow the instructions.

to be continued ...

To store the world, add existing ones or change the default server configuration file,
you can either mount a Docker volume or a local directory (preferred variant).  
Notice that the path to the directory needs to be an absolute; relative ones will not work.  

By default and as pre-programmed in the config file, the files are internally (in Docker)
stored in

    /terraria          <- config file
    /terraria/worlds   <- world files

The "directory notation", to map this internal directory to your computer is

    -v <local, absolute path on you computer>:/terraria

E.g.:

    docker run --rm -it -p 7777:7777 -v /home/hanswurst/terraria:/terraria -e STARTMODE=PC fmmt666/dockerraria

After starting the container, you now would find the files in here:

    /home/hanswurst/terraria          <- the default server config file will be available in here
    /home/hanswurst/terraria/worlds   <- this is where the worlds will appear

To add existing worlds, just copy them to the above folder.

Additional command line arguments for the Terraria server can be added to the end of the line.  
Skipping port and volume for visibility:

    docker run --rm -it  ...  -e STARTMODE=PC fmmt666/dockerraria -world /terraria/worlds/superworld.wld

If everything is running fine, you can omit the `--rm` command, which deletes the container after execution.  

    docker run -it -p 7777:7777 -v /home/hanswurst/terraria:/terraria -e STARTMODE=PC fmmt666/dockerraria


to be continued ...


---

Have a nice day  
FMMT666(ASkr)

---
[1]: https://hub.docker.com/r/fmmt666/dockerraria/
[2]: https://forums.terraria.org/index.php?threads/taking-the-journey-on-the-road-terraria-journeys-end-launches-on-mobile-today.98696/

