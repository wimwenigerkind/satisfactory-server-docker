FROM cm2network/steamcmd:latest

ENV CPU_MHZ=2500

VOLUME ["/satisfactory"]

WORKDIR /satisfactory

RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /satisfactory +app_update 1690800 validate +quit

EXPOSE 7777/udp
EXPOSE 7777/tcp
EXPOSE 15777/udp
EXPOSE 15000/udp

ENTRYPOINT ["./FactoryServer.sh"]