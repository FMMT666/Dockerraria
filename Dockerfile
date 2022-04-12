FROM debian

LABEL maintainer="FMMT666 fmmt666@users.noreply.github.com"


RUN  apt-get -y update && \
     apt-get -y upgrade && \
     apt-get -y install cowsay fortune joe mc wget && \
     echo "alias d='ls -la --color'" >> /root/.bashrc && \
     # links are not directly accessible from web page anymore; analysed via browser web tools
     wget -O tserver.zip "https://terraria.org/api/download/pc-dedicated-server/terraria-server-1436.zip" && \
     unzip tserver.zip && \
     rm tserver.zip && \
     rm -rf /1436/Mac && \
     rm -rf /1436/Windows &&\
     chmod +x '/1436/Linux/TerrariaServer.bin.x86_64' && \
     # links are not directly accessible from web page anymore; analysed via browser web tools
     wget -O tservermobile.zip "https://www.terraria.org/api/download/mobile-dedicated-server/MobileTerrariaServer.zip" && \
     unzip tservermobile.zip &&\
     rm tservermobile.zip &&\
     rm OSX_* &&\
     rm Windows_* &&\
     unzip Linux_*.zip &&\
     rm Linux_*.zip &&\
     chmod +x '/ServerLinux/TerrariaServer.bin.x86_64'

VOLUME /terraria

COPY runthis.sh       /
COPY serverconfig.txt /

ENTRYPOINT ["/runthis.sh"]
