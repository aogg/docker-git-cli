#!/bin/sh

openDir=`pwd`; # 当前打开的目录
currentFiledir=$(cd $(dirname $0); pwd)
currentUserdir=$(cd ~; pwd)
currentUser=`whoami`


volumnData="${currentFiledir}/data"


if [ ! -f ${volumnData}/etc/gitconfig ];then
    mkdir -p ${volumnData}/etc;
    touch ${volumnData}/etc/gitconfig;
fi
if [ ! -d ${volumnData}/user ];then
    mkdir -p ${volumnData}/user;
fi


envString='';
if [ -f ${volumnData}/user/.gitconfig ];then
    envString=`cat ${volumnData}/user/.gitconfig| \
    grep -oE 'commitEncoding\s*=\s*(\w|-)+'| \
    awk -F ' = ' '{if ($2) print "-e LESSCHARSET="$2}'`
fi

workDirString=" -w ${openDir}";
volumnString=" -v ${openDir}:${openDir} ";

notVolumnArr=(
    "/" "/etc" "/etc/local" "/proc" "/dev" "/boot" 
    "/bin" "/sbin" "/usr" "/var" "/lib"
);

for dirIndex in ${!notVolumnArr[@]};do
    if [ ${notVolumnArr[$dirIndex]} == $openDir ];then
        volumnString='';
        workDirString='';
        break;
    fi
done;

if [ $openDir == '/root' ];then
    volumnString='';
    break;
fi

# -v "${volumnData}/etc/gitflow_export:/etc/gitflow_export" \
# -v "${volumnData}/etc/gitignore_global:/etc/gitignore_global" \
docker run -it $envString --rm \
    -v "${volumnData}/etc/gitconfig:/etc/gitconfig" \
    -v "${volumnData}/user/:/root/" \
    $volumnString \
    $workDirString \
    adockero/git-cli \
    git $@
