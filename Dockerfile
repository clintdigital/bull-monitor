FROM node:16-bullseye-slim AS build

RUN apt-get update -y && apt-get install -y \
    python3 \
    g++ \
    cmake

RUN npm i -g @bull-monitor/cli

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

