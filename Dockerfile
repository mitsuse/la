FROM swift:3.1.0

LABEL maintainer="tomoya@mitsuse.jp"

USER root

RUN useradd -g users -G sudo -s /bin/bash -m developer

# Workaround: https://github.com/swiftdocker/docker-swift/issues/70
RUN chmod -R o+r /usr/lib/swift

VOLUME /mnt/project

CMD cd /home/developer && /bin/bash --login
