FROM swift:3.1.0

LABEL maintainer="tomoya@mitsuse.jp"

USER root

RUN apt-get update -q && \
    apt-get install -q -y software-properties-common && \
    add-apt-repository ppa:neovim-ppa/stable && apt-get update && \
    apt-get install -q -y \
    libopenblas-dev \
    zsh \
    neovim

RUN useradd -g users -G sudo -s /bin/zsh -m developer

# Workaround: https://github.com/swiftdocker/docker-swift/issues/70
RUN chmod -R o+r /usr/lib/swift

VOLUME /home/developer
VOLUME /mnt/project

CMD cd /home/developer && /bin/zsh --login
