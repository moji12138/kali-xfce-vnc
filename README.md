# kali-xfce-vnc

### 安装了kali-desktop-xfce 和 x11vnc 的 docker镜像

基于ubuntu:latest镜像构建
安装了以下组件
- x11vnc
- kali-desktop-xfce xfce4-terminal
- Xvfb
- vim net-tools wget 等常用工具


使用`docker build`构建镜像
```
cd kali-xfce-vnc
docker build --rm -t kali-xfce-vnc .
```

启动镜像 VNC默认端口`5901`
```
docker run -it -d -p 5901:5901 kali-xfce-vnc
```

使用VNC Viewer连接 默认密码`123456` 分辨率`1280x800`

修改分辨率和默认密码
```
docker run -it -d -e VNC_RESOLUTION=1280x800 -e VNC_PW=123456 -p 5901:5901 kali-xfce-vnc
```

进入容器但不启动vnc和xfce4
```
docker run -it -p 5901:5901 kali-xfce-vnc bash
```

