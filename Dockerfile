FROM ubuntu:22.04
RUN mkdir -p /opt
WORKDIR /opt

RUN apt update   && \
  apt  install -y --no-install-recommends\
    software-properties-common \
    lsb-release \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libgl-dev \
    libpcre3-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    lzip \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    python3 \
    python3-distutils \
    python3-mako \
    python3-packaging \
    python3-pkg-resources \
    python-is-python3 \
    ruby \
    sed \
    sqlite3 \
    unzip \
    wget \
    xz-utils \
    dirmngr  gpg-agent   nsis  doxygen rubygems \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    

RUN gem install asciidoctor-pdf	
RUN git clone https://github.com/mxe/mxe.git
RUN cd mxe && \
    make  MXE_TARGETS=x86_64-w64-mingw32.static -j4 cc glib libzip libusb1 libftdi1 hidapi glibmm \
    qtbase qtimageformats qtsvg qttranslations boost check gendef libieee1284 \
    && rm -fr .git log .ccache pkg
    
#RUN apt-key adv \
#    --keyserver keyserver.ubuntu.com \
#    --recv-keys 86B72ED9 
	
#RUN add-apt-repository \
#    "deb [arch=amd64] https://pkg.mxe.cc/repos/apt `lsb_release -sc` main" 
	
#RUN apt  update && \
# /bin/bash -c "apt  -y  install  mxe-x86-64-w64-mingw32.static-{gcc,glib,libzip,libusb1,libftdi1,hidapi,glibmm,qtbase,qtimageformats,qtsvg,qttranslations,boost,check,gendef,libieee1284}" && \ 
# rm -fr /var/lib/apt/lists/
  
