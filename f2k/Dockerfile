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
# f2k specific
################################################################################

# Install f2k dependencies
RUN yum install -y \
    GeoIP-devel         \
    udns-devel          \
    libzookeeper-devel  \
    libpcap-devel       \
    librd-devel         \
    librdkafka-devel    \
    rb_macs_vendors     \
    jansson-devel;      \
  yum clean all

# Install devtoolset-4
RUN yum install -y centos-release-scl
RUN yum install -y \
    devtoolset-4-gcc        \
    devtoolset-4-valgrind;  \
  yum clean all

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y

ENV PATH=/root/.cargo/bin:$PATH

RUN git clone https://github.com/Bigomby/dsensorsdb.git; \
  cd dsensorsdb; \
  make release; \
  PREFIX=/usr make install; \
  ln -s /usr/lib/libdsensorsdb.so /usr/lib64/

# Install RPMs
ADD rpms/ /rpms/
RUN yum install -y /rpms/*.rpm
