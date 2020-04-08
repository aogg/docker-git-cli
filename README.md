# docker-git-cli
通过docker封装git执行命令，这样就不需要本地下载git了，也能解决centos的yum安装不是最新版本的问题


https://hub.docker.com/r/adockero/git-cli
[![git-cli](http://dockeri.co/image/adockero/git-cli)](https://hub.docker.com/r/adockero/git-cli)



# 介绍

1、基于docker实现，容器基础镜像用的是debian。其中每次只需git.sh都会通过新容器的方式执行git命令，所以git配置文件会通过数据卷来存储。  
2、git.sh是用来代替本地git命令行的，可设置alias简化命令名称长度  
3、容器内git相关配置，放在当前执行文件的所在目录的data文件夹下  
4、执行git命令时会共享当前打开的文件夹，正确使用还是要去到项目文件夹中。同时要留意windows for docker和mac for docker的共享数据卷是否包含当前文件夹否则会报错


# 使用
```bash
# 下载git.sh命令
# gitee
wget -P $(pwd)/git-cli/ -N https://gitee.com/ao-lol/docker-git-cli/raw/master/git.sh
# github
# wget -P $(pwd)/git-cli/ -N https://raw.githubusercontent.com/aogg/docker-git-cli/master/git.sh
# 添加软链接到path
ln -s $(pwd)/git.sh /usr/bin/git
# 第一次执行
git
```

## 更新git
```bash
# 下载git.sh命令
# gitee
wget -P $(pwd)/git-cli/ -N https://gitee.com/ao-lol/docker-git-cli/raw/master/git.sh
# github
# wget -P $(pwd)/git-cli/ -N https://raw.githubusercontent.com/aogg/docker-git-cli/master/git.sh
# 添加软链接到path
docker pull adockero/git-cli
# 检查
git
```

## 注意
1、暂不支持管道|
2、同样也不支持nohup命令


# 小技巧

## 1、设置中文支持
```bash
git config --global i18n.commitencoding utf-8
git config --global i18n.logoutputencoding utf-8
```
