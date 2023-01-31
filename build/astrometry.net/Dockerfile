FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update && apt install -y apt-utils && \
    apt install -y --no-install-recommends \
    build-essential \
    make \
    gcc \
    git \
    file \
    pkg-config \
    wget \
    curl \
    swig \
    netpbm \
    wcslib-dev \
    wcslib-tools \
    zlib1g-dev \
    libbz2-dev \
    libcairo2-dev \
    libcfitsio-dev \
    libcfitsio-bin \
    libgsl-dev \
    libjpeg-dev \
    libnetpbm10-dev \
    libpng-dev \
    python3 \
    python3-dev \
    python3-pip \
    python3-pil \
    python3-tk \
    python3-setuptools \
    python3-wheel \
    python3-numpy \
    python3-scipy \
    python3-matplotlib \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Pip installs
RUN for x in \
    fitsio \
    astropy \
    ; do pip3 install --no-cache-dir $x; done

WORKDIR /Users/zhouwenzhe/src

# Astrometry.net
RUN git clone https://github.com/dstndstn/astrometry.net.git astrometry \
    && cd astrometry \
    && make \
    && make py \
    && make extra \
    && make install INSTALL_DIR=/usr/local \
    && make clean

# python = python3
RUN ln -s /usr/bin/python3 /usr/bin/python
ENV PYTHONPATH=/usr/local/lib/python

RUN pip install --no-cache-dir Django

RUN apt -y update && \
    apt install -y --no-install-recommends \
    apache2 \
    libapache2-mod-wsgi-py3 \
    less \
    emacs-nox

RUN pip install --no-cache-dir \
    social-auth-core django-social-auth3 social-auth-app-django

WORKDIR /Users/zhouwenzhe/src/astrometry/net

RUN ln -s settings_test.py settings.py

# Yuck!  The installed 'astrometry' package conflicts with '.', so paste it in...
RUN rm -R /usr/local/lib/python/astrometry/net && \
    ln -s /Users/zhouwenzhe/src/astrometry/net /usr/local/lib/python/astrometry/net

RUN mv appsecrets-example appsecrets

RUN git stash && git pull

RUN mv migrations/* /tmp && \
    python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py makemigrations net && \
    python manage.py migrate net && \
    python manage.py loaddata fixtures/initial_data.json && \
    python manage.py loaddata fixtures/flags.json

# CMD python manage.py runserver

# EXPOSE 8000

#打开sshd
#RUN apt update && apt install  openssh-server sudo -y
#
#RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test
#
#RUN  echo 'test:test' | chpasswd
#
#RUN service ssh start
#
#EXPOSE 22
#
#CMD ["/usr/sbin/sshd","-D"]