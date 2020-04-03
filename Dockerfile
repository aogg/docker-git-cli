FROM debian:10-slim

RUN apt update && apt install -y git && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["git"]
