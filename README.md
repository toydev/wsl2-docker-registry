# 概要

WSL2 の Ubuntu 22.04 上で以下を動かします。

- Docker Registry

# インストール

- 前準備をする。

前提ソフトウェア（docker / mkcert）をインストールします。

```
./setup.sh
```

- WSL のターミナルを開きなおす（一般ユーザの docker へのアクセスを有効にするため）。

- docker サービスを起動する。

```
sudo service docker start
```

- docker_registry.conf.default を docker_registry.conf にコピーして編集する。

- Docker Registry を起動する。

docker で Docker Registry を起動します。

```
./start.sh
```

# 動作確認

hello-world コンテナをプッシュします。

```
source docker_registry.conf

docker pull hello-world
docker tag hello-world localhost:$DOCKER_REGISTRY_PORT/hello-world
docker push localhost:$DOCKER_REGISTRY_PORT/hello-world
```

# PC の再起動時

docker サービスを起動してください。

```
sudo service docker start
```

次に Docker Registry を起動してください。

```
./start.sh
```
