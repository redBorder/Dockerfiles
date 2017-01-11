FROM redborder/centos:latest
MAINTAINER redBorder

################################################################################
# redBorder C++ general
################################################################################

# Install dependencies
RUN dnf install -y      \
    gcc-c++             \
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
    gtest               \
    gtest-devel         \
    slang-devel;        \
  dnf clean all

# Set workdir
WORKDIR /app

################################################################################
# flow2kafka specific
################################################################################

# Install nprobe dependencies
RUN dnf install -y \
    librd-devel         \
    librdkafka-devel;   \
  dnf clean all

# Install devtoolset-4
RUN dnf install -y centos-release-scl
RUN dnf install -y \
    devtoolset-4-g++        \
    devtoolset-4-valgrind;  \
  dnf clean all

# Install RPMs
ADD rpms/ /rpms/
RUN dnf install -y /rpms/*.rpm
