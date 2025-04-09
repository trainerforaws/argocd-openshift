FROM centos:8

# Fix mirror and install nginx + envsubst
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \
    yum -y install epel-release && \
    yum -y install nginx gettext && \
    yum clean all

# Copy necessary files
COPY index.html /usr/share/nginx/html/index.html.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]