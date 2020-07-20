# 使用docker部署项目

## maven构建docker镜像

使用docker的profile package

```bash
mvn clean package -Pdocker -DskipTests
```

## 删除maven构建docker镜像

```bash
docker stop balance
docker rm balance
docker rmi monezhao/balance:latest
```

## docker 镜像备份

```bash
docker save openjdk:8u232-jre > jre8.tar
docker save redis:5.0.9 > redis.tar
docker save mysql:8.0.18 > mysql.tar
docker save monezhao/balance:latest > balance.tar
```

## docker 镜像还原

```bash
docker load < jre8.tar
docker load < redis.tar
docker load < mysql.tar
docker load < balance.tar
```

## docker 启动容器

```bash
# mysql镜像需要命名为mysql
docker run --restart=always -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=112012  -d mysql:8.0.18 --default-authentication-plugin=mysql_native_password

# redis
docker run --restart=always -d --name redis -p 6379:6379 redis:5.0.9

# 用--link连接MySQL redis
docker run --restart=always -d --name balance --link=mysql:mysql --link=redis:redis -p 8686:8686 monezhao/balance:latest
```

## 解决docker 容器内访问宿主机“No route to host”的问题

```bash
nmcli connection modify docker0 connection.zone trusted

systemctl stop NetworkManager.service
firewall-cmd --permanent --zone=trusted --change-interface=docker0
systemctl start NetworkManager.service
nmcli connection modify docker0 connection.zone trusted
systemctl restart docker.service
```

## 使用idea docker插件部署docker

### 配置远程访问

#### Windows

打开docker的设置界面，找到`General`,在里面找到`Expose daemon on tcp://localhost:2375 without TLS`选项，打上勾，即可进行本地或远程API调用。

如果无法访问，这需要在`Docker Engine`的json中加入:
```
  "hosts": ["tcp://0.0.0.0:2375"]
```

重启Docker，如果启动报错，这需要在状态栏图标右键，`Switch to Windows containers` 

#### Linux

```bash
vim /lib/systemd/system/docker.service
```

修改以ExecStart开头的行：

```text
ExecStart=/usr/bin/dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375
```

保存文件后执行:

```bash
systemctl daemon-reload
service docker restart
curl http://localhost:2375/version
```

### 配置idea连接docker服务

1. 查看插件列表中是否安葬`Docker`插件并启用
2. `设置`中`Build,Execution,Deployment - Docker`配置远程Docker
3. `Edit Configuration`添加docker启动项
    ```text
    DockerFile - balance-manager/src/main/docker/Dockerfile
    Context Folder - balance-manager/target
    Image Tag - monezhao/balance
    ```
4. 取消`run built image`
5. `Before launch`中配置`Run Maven Goal - clean package -DskipTests -Pidea`
6. 运行`docker`启动项