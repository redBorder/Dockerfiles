cat <<EOF > /etc/yum.repos.d/dnf-stack-el7.repo
[dnf-stack-el7]
name=Copr repo for dnf-stack-el7 owned by @rpm-software-management
baseurl=https://copr-be.cloud.fedoraproject.org/results/@rpm-software-management/dnf-stack-el7/epel-7-\$basearch/
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/@rpm-software-management/dnf-stack-el7/pubkey.gpg
enabled=1
enabled_metadata=1
EOF
