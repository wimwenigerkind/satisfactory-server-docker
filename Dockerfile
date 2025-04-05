# Use the official steamcmd image as the base image
FROM cm2network/steamcmd:latest

# Set the CPU_MHZ environment variable
ENV CPU_MHZ=2500

# Define a volume for the Satisfactory server data
VOLUME ["/satisfactory"]

# Set the working directory to /satisfactory
WORKDIR /satisfactory

# Install the Satisfactory server using steamcmd
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /satisfactory +app_update 1690800 validate +quit

# Expose the necessary ports for the Satisfactory server
EXPOSE 7777/udp
EXPOSE 7777/tcp
EXPOSE 15777/udp
EXPOSE 15000/udp

# Set the entrypoint to start the Satisfactory server
ENTRYPOINT ["./FactoryServer.sh"]