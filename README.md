Dockerraria
===========

Just another [Terraria server for Docker][1]  

---

A plain and simple Terraria server in a Docker container.  
Can also be deployed in a Synology NAS (Intel CPUs only).

Actually, that's what I created it for :)

---
## STATUS 2020/05/23:

  Terraria server 1.4.0.4  


---
## NEWS:

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
## TODO:

  - Synology installation/configure instructions and images
  - ...

    
---
## INSTALLATION:

### Linux/macOS/Windows

Get the Docker image from the Docker hub:

    docker pull fmmt666/dockerraria

Quick test, notice that the generated world will not be saved:

    docker run --rm -it -p 7777:7777 fmmt666/dockerraria config

And follow the instructions.

to be continued...


### Synology

  - Inside the Docker app, go to "Registry" and search for "fmmt666/dockerraria".
  - Fetch the image by either a double clicking or right-click and selecting "download image".
  - Go to the "Container" tab, highlight the downloaded image and click "Start".
  - Click on "advanced settings" at the bottom.
  - In tab "Volume" click "Add Folder" and select the place where the worlds shall be stored,
    e.g. "/docker/terraria" and enter the mount path "/terraria".
    Notice: Do _not_ change the mount path. This must be "/terraria".
  - In "Port-Settings" enter local port "7777" and container port "7777".
  - IMPORTANT: In the "Environment" tab, enter "config" in the "Execution Command" field at the bottom.

Start the container.  
After a while, go to "Container" and the "Details" of the running container and follow the
instructions in the "Terminal" tab.

    Warning: The Synology web app tends to crash (at least Firefox),
    while the world is generated. Those hundreds of lines with server
    messages is just too much for this GHz CPU, lol...
    One solution is to quickly leave the "Terminal" tab and come back after 3..4 minutes.

to be continued...


---
### USAGE:

to be written...


---
### INTERNALS:



---

Have a nice day  
FMMT666(ASkr)

---
[1]: https://hub.docker.com/r/fmmt666/dockerraria/
