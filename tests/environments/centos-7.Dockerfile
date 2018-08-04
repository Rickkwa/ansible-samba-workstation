FROM centos:7
EXPOSE 22

ENTRYPOINT ["/usr/sbin/init"]

# From https://hub.docker.com/r/centos/systemd/~/dockerfile/
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME ["/sys/fs/cgroup"]

RUN yum -y install openssh-server passwd net-tools; yum clean all
RUN mkdir /var/run/sshd && \
    echo -e "hunter2\nhunter2" | (passwd root) && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    systemctl enable sshd
