FROM kalilinux/kali-rolling:latest
  
ENV DISPLAY=:1 \
    VNC_PORT=5901

EXPOSE $VNC_PORT

### Envrionment config
ENV HOME=/root \
    TERM=xtrem\
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x800 \
    VNC_PW_PATH=/root/.vncpass \
    VNC_PW=123456 \
    LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8'

RUN apt-get update \
    && apt-get install -y locales ttf-wqy-zenhei ttf-wqy-microhei \
    && locale-gen en_US.UTF-8

RUN apt-get install -y vim wget net-tools bzip2 \
    kali-desktop-xfce xfce4-terminal x11vnc xvfb firefox-esr \
    x11-xserver-utils dconf-editor dbus-x11
    

ADD ./startup.sh /startup/startup.sh
RUN chmod +x /startup/startup.sh

WORKDIR ${HOME}

ENTRYPOINT [ "/startup/startup.sh" ]
