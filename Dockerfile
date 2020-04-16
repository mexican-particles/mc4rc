FROM node:alpine

ENV TZ Asia/Tokyo
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    apk del tzdata

RUN apk add --no-cache bash openjdk11-jre wget git

WORKDIR /var/lib/mc

ENTRYPOINT ["./entrypoint.sh"]
