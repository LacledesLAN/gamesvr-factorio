# escape=`
FROM lacledeslan/steamcmd:linux as factorio-builder

ARG VERSION=1.1.50

RUN wget -O /tmp/factorio.tar.xz https://www.factorio.com/get-download/"$VERSION"/headless/linux64 &&`
    tar -xJf /tmp/factorio.tar.xz -C /output;

#=======================================================================
FROM debian:bullseye-slim

ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified

HEALTHCHECK NONE

RUN apt-get update && apt-get install -y `
        ca-certificates locales locales-all tmux &&`
    apt-get clean &&`
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*;

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

LABEL maintainer="Laclede's LAN <contact@lacledeslan.com>" `
      com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/LacledesLAN/README.1ST" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Laclede's LAN" `
      org.label-schema.description="Factorio Dedicated Server" `
      org.label-schema.vcs-url="https://github.com/LacledesLAN/gamesvr-factorio"

# Set up Enviornment
RUN useradd --home /app --gid root --system Factorio &&`
    mkdir -p /app/saves &&`
    chown Factorio:root -R /app;

COPY --chown=Factorio:root --from=factorio-builder /output/factorio /app

RUN chmod +x /app/bin/x64;

COPY --chown=Factorio:root /dist/linux /app

WORKDIR /app

USER Factorio
