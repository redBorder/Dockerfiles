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
# rb_monitor specific
################################################################################

# Install dependencies for rb_monitor
RUN yum install -y      \
    librd-devel         \
    librdkafka-devel    \
    libmatheval-devel   \
    net-snmp-devel      \
    json-c-devel        \
    libpcap-devel;      \
  yum clean all

# Install devtoolset-4
RUN yum install -y centos-release-scl
RUN yum install -y          \
    devtoolset-4-gcc        \
    devtoolset-4-valgrind;  \
  yum clean all

# Install RPMs
COPY rpms/ /rpms/
RUN yum install -y /rpms/*.rpm; \
  rm -rf /rpms
