FROM docker.io/alpine:3.18.2

# https://git.alpinelinux.org/aports/log/main/rsync?h=3.18-stable
ARG RSYNC_PACKAGE_VERSION=3.2.7-r4
# https://www.openssh.com/releasenotes.html
# https://git.alpinelinux.org/aports/log/main/openssh?h=3.18-stable
ARG OPENSSH_SERVER_PACKAGE_VERSION=9.3_p2-r0
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
