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

# Set workdir
WORKDIR /app
