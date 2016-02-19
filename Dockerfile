FROM ubuntu:14.04

MAINTAINER Thoba Lose 'thoba@sanbi.ac.za'
    # update and upgrade
RUN apt-get -y update --fix-missing && \
    # install the platform's build kit, nginx, and supervisor:
    apt-get -y upgrade && \

    apt-get -y install build-essential \
                       python-dev \
                       libjpeg-dev \
                       libxslt-dev \
                       supervisor \
                       zlib1g-dev \
                       wget \
                       libssl-dev \
                       gcc git-core libffi-dev libpcre3 libpcre3-dev autoconf libtool pkg-config \
                       libssl-dev libexpat1-dev libxslt1.1 \
                       gnuplot libcairo2 libpango1.0-0 libgdk-pixbuf2.0-0
# Download latest version
RUN wget --no-check-certificate https://launchpad.net/plone/5.0/5.0/+download/Plone-5.0-UnifiedInstaller.tgz

RUN tar -xf Plone-5.0-UnifiedInstaller.tgz && \
    cd Plone-5.0-UnifiedInstaller && \
    # TODO: We might want to remove the --password here
    sudo ./install.sh --target=/usr/local/Plone --password=adminpassword --build-python zeo

# use supervisor to start Plone with the server.
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080

CMD ["/usr/bin/supervisord"]


