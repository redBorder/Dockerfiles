FROM centos:7
MAINTAINER redBorder

################################################################################
# redBorder C general
################################################################################

# Add repositories and dnf
COPY install-dnf.sh /tmp
RUN yum install -y epel-release;                                               \
  rpm -ivh http://repo.redborder.com/redborder-repo-0.0.3-1.el7.rb.noarch.rpm; \
  chmod +x /tmp/install-dnf.sh;                                                \
  bash /tmp/install-dnf.sh;                                                    \
  yum install -y dnf;                                                          \
  dnf install -y dnf-plugins-core

# Install dependencies
RUN yum install -y      \
    gcc                 \
    git                 \
    gdb                 \
    cgdb                \
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
  dnf clean all

# Set workdir
WORKDIR /app

################################################################################
# n2kafka specific
################################################################################

# Install dependencies from Redborder repo
RUN yum install -y \
    expat-devel         \
    ncurses-devel       \
    libpsl-devel        \
    libev-devel         \
    zlib-devel          \
    libmicrohttpd-devel \
    libcurl-devel       \
    librd-devel         \
    librdkafka-devel    \
    jansson-devel       \
    yajl-devel;         \
  yum clean all

# Install devtoolset-4
RUN yum install -y centos-release-scl; \
  yum install -y \
    devtoolset-4-gcc        \
    devtoolset-4-valgrind;  \
  yum clean all

# Install RPMs
COPY rpms/ /rpms/
RUN rpm -i /rpms/*.rpm
