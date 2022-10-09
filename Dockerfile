FROM ghcr.io/linuxserver/baseimage-rdesktop-web:fedora

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
  echo "**** install packages ****" && \
  dnf install -y --setopt=install_weak_deps=False --best \
    firefox \
    marco \
    mate-control-center \
    mate-desktop \
    mate-icon-theme \
    mate-media \
    mate-menus \
    mate-menus-preferences-category-menu \
    mate-panel \
    mate-session-manager \
    mate-terminal \
    mate-themes \
    pluma && \
  echo "**** cleanup ****" && \
  dnf autoremove -y && \
  dnf clean all && \
  rm -rf \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
VOLUME /config
