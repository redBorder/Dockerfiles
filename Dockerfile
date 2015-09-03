FROM centos:7
MAINTAINER Diego Fernández

# Add epel
RUN yum install -y epel-release

# Install common redborder dependencies
RUN echo '10.0.70.31 rbrepo.redborder.lan' | tee --append /etc/hosts; \
  rpm -ivh http://rbrepo.redborder.lan/redBorder/rbrepo-1.0.0-1.el7.rb.noarch.rpm; \
  yum install -y \
    gcc                 \
    make                \
    tar                 \
    which               \
    wget                \
    lcov                \
    cmake               \
    valgrind            \
    slang-devel         \
    libcmocka-devel;    \
  yum clean all
