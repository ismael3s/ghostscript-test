FROM alpine

RUN apk add --no-cache ghostscript

WORKDIR /scripts

COPY ./script.sh .

RUN chmod +x script.sh

CMD ["sh", "script.sh"]