FROM ghcr.io/maggie0002/dockerize as dockerize

RUN apk add jq

RUN dockerize -n -o /app/ -a $(which jq) $(which jq)

FROM ghcr.io/maggie0002/tiny-curl as tiny-curl

FROM ghcr.io/maggie0002/tiny-sh

COPY --from=tiny-curl /build .

COPY --from=dockerize /app .

COPY start.sh start.sh