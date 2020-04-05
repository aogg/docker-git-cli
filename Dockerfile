FROM debian

RUN apt update && apt install -y man git && rm -rf /var/lib/apt/lists/*

