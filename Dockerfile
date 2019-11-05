FROM alpine:3.10.1
MAINTAINER Hugo Blom hugo.blom1@gmail.com

# Dependencies
RUN apk add ca-certificates curl unzip

# Add xteve binary
ADD https://xteve.de/download/xteve_2_linux_amd64.zip /tmp/xteve_amd64.zip

# Unzip the Binary
RUN unzip -o /tmp/xteve_amd64.zip -d /xteve

# Clean up the .zip
RUN rm /tmp/xteve_amd64.zip

# Set executable permissions
RUN chmod +x /xteve/xteve

# Volumes
VOLUME /root/.xteve
VOLUME /tmp/xteve

# Expose Ports for Access
EXPOSE 34400

# Healthcheck
  
# Entrypoint should be the base command
ENTRYPOINT ["/xteve/xteve"]

# Command should be the basic working
CMD ["-port=34400"]
