FROM rust:latest as builder
RUN apt-get update && apt-get install -y libfontconfig1-dev libgraphite2-dev libharfbuzz-dev libicu-dev zlib1g-dev

# use a version with better caching implemented
RUN cargo install --git https://github.com/rekka/tectonic.git --branch feat-85-cache-index --force tectonic
WORKDIR /usr/src/tex
COPY *.tex ./
RUN for f in *.tex; do tectonic $f; done

FROM debian:stretch-slim
RUN apt-get update \
     && apt-get install -y --no-install-recommends libfontconfig1 libgraphite2-3 libharfbuzz0b libicu57 zlib1g libharfbuzz-icu0 libssl1.1 ca-certificates \
    && rm -rf /var/lib/apt/lists/* 

COPY --from=builder /usr/local/cargo/bin/tectonic /usr/bin/
COPY --from=builder /root/.cache/Tectonic/ /root/.cache/Tectonic/
WORKDIR /usr/src/tex

