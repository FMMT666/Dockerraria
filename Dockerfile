FROM debian

LABEL maintainer="FMMT666 fmmt666@users.noreply.github.com"


RUN  apt-get -y update && \
     apt-get -y upgrade && \
     apt-get -y install cowsay fortune joe mc wget && \
     echo "alias d='ls -la --color'" >> /root/.bashrc && \
     wget -O tserver.zip "https://terraria.org/system/dedicated_servers/archives/000/000/037/original/terraria-server-1403.zip" && \
     unzip tserver.zip && \
     rm tserver.zip && \
     chmod +x '/1403/Linux/TerrariaServer.bin.x86_64' && \
     rm -rf /1403/Mac && \
     rm -rf /1403/Windows

VOLUME /terraria

COPY runthis.sh       /
COPY serverconfig.txt /

ENTRYPOINT ["/runthis.sh"]
