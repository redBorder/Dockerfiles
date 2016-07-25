FROM centos:7
MAINTAINER redBorder

# Add epel
RUN yum install -y epel-release

# Install common redborder dependencies
RUN rpm -ivh http://repo.redborder.com/redborder-repo-1.0.0-1.el7.rb.noarch.rpm; \
  yum install -y \
    gcc                 \
    make                \
    tar                 \
    which               \
    ruby                \
    wget                \
    lcov                \
    cmake               \
    valgrind            \
    slang-devel         \
    libcmocka-devel;    \
  yum clean all


# Install freeradius dependencies
RUN echo '10.0.70.31 rbrepo.redborder.lan' | tee --append /etc/hosts; \
  yum install -y \
     libtool		\
     perl-devel		\
     librd-devel        \
     rbutils-devel      \
     librdkafka-devel   \
    git;		\
  yum clean all

### ./configure --with-default-snmp-version=3 --with-rdkafka --with-sys-contact="@redborder.net" --with-sys-location="Unknown" --with-logfile=/var/log/snmpd.log --with-persistent-directory=/var/net-snmp --disable-agent --disable-manuals --disable-scripts --disable-mibs


# Set workdir
WORKDIR /app
