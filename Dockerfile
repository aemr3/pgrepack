ARG BITNAMI_IMAGE=15.3.0-debian-11-r0

FROM bitnami/postgresql:${BITNAMI_IMAGE}

USER root

RUN apt-get update && \
  apt-get install -y python3 python3-pip libssl-dev liblz4-dev && \
  rm -rf /var/lib/apt/lists/* && \
  pip3 install --no-cache-dir pgxnclient && \
  pgxn install pg_repack && \
  useradd -r -u 1001 -g root postgres

USER postgres
