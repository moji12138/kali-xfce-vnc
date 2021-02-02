#!/usr/bin/env bash

set -e

if [ -z "$@" ];then
    # 启动Xvfb 虚拟显示器
    Xvfb $DISPLAY -screen 0 ${VNC_RESOLUTION}x${VNC_COL_DEPTH} &
    # 设置vnc密码
    x11vnc --storepasswd ${VNC_PW} ${VNC_PW_PATH}
    # 启动vnc server
    x11vnc -display $DISPLAY -once -loop -noxdamage -repeat -rfbauth $VNC_PW_PATH -rfbport ${VNC_PORT} -shared  -scale ${VNC_RESOLUTION} &
    # 获取显示权限
    xhost +
    # 禁用电源管理和休眠
    xset -dpms &
    xset s noblank &
    xset s off &
    # 启动xfce4
    startxfce4
else
    echo "--------------- 执行命令[ $@ ] ---------------"
    exec "$@"
fi
