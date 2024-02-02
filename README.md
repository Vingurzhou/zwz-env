# zwz-env

一个基于 `docker` 的本地开发运行环境。

## 启动
```shell
docker-compose build --no-cache
```
```shell
docker-compose -f docker-compose.yml up -d elasticsearch kibana
docker-compose -f docker-compose.yml up -d etcd
docker-compose -f docker-compose.yml up -d redis
docker-compose -f docker-compose.yml up -d ubuntu_20_04
```

