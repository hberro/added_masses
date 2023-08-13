FROM quay.io/singularity/singularity:v3.11.4

USER root

RUN apk update && apk upgrade && apk add git git-lfs sudo libc6-compat

# gitpod/vscode requirements
RUN apk add \
    iptables \
    gcompat \
    libstdc++ \
    libgcc \
    curl

RUN addgroup -g 33333 gitpod \
    && echo '%gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod \
    && adduser -u 33333 -G gitpod -h /home/gitpod -s /bin/bash -D gitpod \
    && mkdir /workspace && chown -hR gitpod:gitpod /workspace

ENTRYPOINT []

USER gitpod
