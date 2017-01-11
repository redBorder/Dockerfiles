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
  yum install -y dnf                                                           \
  dnf install -y dnf-plugins-core;
