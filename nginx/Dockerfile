FROM nginx:alpine

ENV TZ Asia/Tokyo
RUN apk add --no-cache curl bash tzdata && \
    cp /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    apk del tzdata

WORKDIR /var/www

COPY ./scripts .
COPY . /tmp/csr

RUN mkdir /home/www
ARG VALIDATOR_FILE_NAME
COPY ./certification/${VALIDATOR_FILE_NAME} /home/www/
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.orig

RUN apk add --no-cache openssl
