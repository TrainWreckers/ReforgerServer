FROM debian:bullseye-slim

EXPOSE 2001/udp

ENV APPID="1874900"
ENV STEAM_USER="anonymous"
ENV STEAM_PW=""
ENV ARMA_CONFIG=""

COPY /setup.sh  /
COPY /run.sh /

RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    libcurl4 \
    net-tools \
    libssl1.1  \
    lib32stdc++6 \
    lib32gcc-s1 \
    wget \
    ca-certificates && \
    apt-get remove --purge -y && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /steamcmd && \
    mkdir -p /arma_reforger/profile && \
    wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxf - -C /steamcmd

ENV TRACY_NO_INVARIANT_CHECK=1

RUN /setup.sh

CMD ["sh", "/run.sh"]

