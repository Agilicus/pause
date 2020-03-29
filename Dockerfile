FROM ubuntu:20.04 as build
LABEL maintainer="Don Bowman <don@agilicus.com>"

COPY ./pause.c /tmp
RUN apt-get update \
 && apt-get install -y gcc \
 && gcc -o /usr/local/bin/pause /tmp/pause.c

FROM ubuntu:20.04
LABEL maintainer="Don Bowman <don@agilicus.com>"
COPY --from=build /usr/local/bin/pause /usr/local/bin/pause
CMD /usr/local/bin/pause
