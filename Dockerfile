FROM docker.io/alpine:3.16.0

ARG RSYNC_PACKAGE_VERSION=3.2.4-r1
ARG OPENSSH_SERVER_PACKAGE_VERSION=9.0_p1-r1
RUN apk add --no-cache \
    openssh-server=$OPENSSH_SERVER_PACKAGE_VERSION \
    rrsync=$RSYNC_PACKAGE_VERSION \
    rsync=$RSYNC_PACKAGE_VERSION

ENV SSHD_HOST_KEYS_DIR /etc/ssh/host_keys
VOLUME $SSHD_HOST_KEYS_DIR

COPY sshd_config /etc/ssh/sshd_config

# comma-separated list of usernames
ENV USERS ""

EXPOSE 22/tcp

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e"]
