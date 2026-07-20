FROM lacledeslan/steamcmd AS factorio-builder

RUN wget -O /tmp/factorio.tar.xz https://factorio.com/get-download/stable/headless/linux64 && \
    tar -xJf /tmp/factorio.tar.xz -C /output;


#---------------------------------
FROM debian:bullseye-slim

ARG BUILD_DATE=unspecified \
    BUILD_NODE=unspecified \
    GIT_REVISION=unspecified

HEALTHCHECK NONE

LABEL architecture="amd64" \
      com.lacledeslan.build-node="$BUILD_NODE" \
      maintainer="Laclede's LAN <contact@lacledeslan.com>" \
      org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.description="Factorio Dedicated Server" \
      org.opencontainers.image.revision="$GIT_REVISION" \
      org.opencontainers.image.source="https://github.com/LacledesLAN/gamesvr-factorio" \
      org.opencontainers.image.vendor="Laclede's LAN"

RUN apt-get update && apt-get install -y \
        ca-certificates locales locales-all tmux && \
    apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*;

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

# Set up Enviornment
RUN useradd --home /app --gid root --system Factorio && \
    mkdir -p /app/saves && \
    chown Factorio:root -R /app;

COPY --chown=Factorio:root --from=factorio-builder /output/factorio /app

COPY --chown=Factorio:root /dist/linux /app

RUN chmod +x /app/bin/x64 && \
    chmod +x /app/ll-tests/*.sh;

WORKDIR /app

USER Factorio
