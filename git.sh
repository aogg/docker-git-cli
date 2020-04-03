#!/bin/sh

workdir=$(cd $(dirname $0); pwd)

# 循环参数 todo

docker run -it --rm adockero/git "$@"
