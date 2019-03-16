FROM alpine:3.9.2 as build
LABEL maintainer="Don Bowman <don@agilicus.com>"

COPY ./pause.c /tmp
RUN apk add gcc build-base \
 && gcc -o /usr/local/bin/pause /tmp/pause.c

FROM alpine:3.9.2
LABEL maintainer="Don Bowman <don@agilicus.com>"
COPY --from=build /usr/local/bin/pause /usr/local/bin/pause
CMD /usr/local/bin/pause
