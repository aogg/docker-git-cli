# docker-git-cli
通过docker封装git执行命令，这样就不需要本地下载git了，也能解决centos的yum安装不是最新版本的问题


# 介绍

1、基于docker实现，容器基础镜像用的是debian，竟可能的小镜像  
2、git.sh是用来代替本地git命令行的，可设置alias简化命令名称长度
3、容器内git相关配置，放在当前执行文件的所在目录的data文件夹下  
4、执行git命令时会共享当前打开的文件夹，正确使用还是要去到项目文件夹中。同时要留意windows for docker和mac for docker的共享数据卷是否包含当前文件夹否则会报错


# 小技巧

## 1、设置中文支持
```bash
git config --global i18n.commitencoding utf-8
git config --global i18n.logoutputencoding utf-8
```
