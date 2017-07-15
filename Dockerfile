FROM swift:3.1.0

EXPOSE 9000

RUN mkdir /root/project

ADD Package.swift /root/project
ADD Sources /root/project/Sources
ADD Tests /root/project/Tests

USER root

CMD ["swift", "test", "-C", "/root/project"]
