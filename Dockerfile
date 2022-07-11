FROM ghcr.io/maggie0002/tiny-curl as tiny-curl

FROM ghcr.io/maggie0002/dockerize as dockerize

RUN apk add jq

RUN dockerize -n -o /app/ -a $(which jq) $(which jq) $(which sh) $(which sh)

FROM scratch

COPY --from=tiny-curl / .

COPY --from=dockerize /app .

COPY start.sh start.sh

CMD ["sh", "start.sh"]