# Factorio Dedicated Server in Docker

Factorio is a game in which you build and maintain factories. In the beginning you will find yourself chopping trees, mining ores and crafting mechanical arms and transport belts by hand, but in short time you can become an industrial powerhouse, with huge solar fields, oil refining and cracking, manufacture and deployment of construction and logistic robots, all for your resource needs. However this heavy exploitation of the planet's resources does not sit nicely with the locals, so you will have to be prepared to defend yourself and your machine empire.

![Factorio Dedicated Server in Docker](https://raw.githubusercontent.com/LacledesLAN/gamesvr-factorio/main/.misc/banner-gamesvr-factorio.jpg)

This repository is maintained by [Laclede's LAN](https://lacledeslan.com). Its contents are intended to be bare-bones and used as a stock server. For examples of building a customized server from this Docker image browse its related child-project [gamesvr-factorio-freeplay](https://github.com/LacledesLAN/gamesvr-factorio-freeplay). If any documentation is unclear or it has any issues please see [CONTRIBUTING.md](./CONTRIBUTING.md).

## Linux

[![linux/amd64](https://github.com/LacledesLAN/gamesvr-factorio/actions/workflows/build-linux-image.yml/badge.svg?branch=main)](https://github.com/LacledesLAN/gamesvr-factorio/actions/workflows/build-linux-image.yml)

### Download

```shell
docker pull lacledeslan/gamesvr-factorio
```

### Run Self Tests

```shell
docker run -it --rm lacledeslan/gamesvr-factorio ./ll-tests/gamesvr-factorio.sh;
```

### Run Simple, Interactive Server

This assumes an empty map was generated, and saved to `app/saves/save.zip` inside of the Docker image.

```shell
docker run -it --rm -p 34197:34197/udp /app/bin/x64/factorio --start-server /app/saves/save.zip;
```

## Getting Started with Game Servers in Docker

[Docker](https://docs.docker.com/) is an open-source project that bundles applications into lightweight, portable, self-sufficient containers. For a crash course on running Dockerized game servers check out [Using Docker for Game Servers](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/DockerAndGameServers.md). For tips, tricks, and recommended tools for working with Laclede's LAN Dockerized game server repos see the guide for [Working with our Game Server Repos](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/WorkingWithOurRepos.md). You can also browse all of our other Dockerized game servers: [Laclede's LAN Game Servers Directory](https://github.com/LacledesLAN/README.1ST/tree/master/GameServers).
