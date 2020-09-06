# docker: openssh-server restricted to rsync 🐳

repo: https://github.com/fphammerle/docker-rsync-sshd

docker hub: https://hub.docker.com/r/fphammerle/rsync-sshd

SSH clients are restricted to `rsync --server` commands via [rrsync](https://download.samba.org/pub/unpacked/rsync/support/rrsync).

rrsync prefixes `/data` to all paths (e.g., `rsync ... host:/src /backup` downloads `/data/src`).

## example 1

```sh
$ docker run --name=rsync-sshd -p 2022:22 -e USERS=alice,bob -v rsync-data:/data:ro fphammerle/rsync-sshd
$ docker cp alice-keys rsync-sshd:/home/alice/.ssh/authorized_keys
$ docker cp bob-keys rsync-sshd:/home/bob/.ssh/authorized_keys
```

## example 2

```
$ docker run --name rsync-sshd \
    --publish 2022:22 --env USERS=alice,bob \
    --volume accessible-data:/data:ro \
    --volume host-keys:/etc/ssh/host_keys \
    --volume alice-ssh-config:/home/alice/.ssh:ro \
    --volume bob-ssh-config:/home/bob/.ssh:ro \
    --init --rm \
    fphammerle/rsync-sshd
$ rsync -av --rsh='ssh -p 2022' alice@localhost:/source /target
```

required capabilities:
- NET_BIND_SERVICE
- SETGID
- SETUID
- SYS_CHROOT
