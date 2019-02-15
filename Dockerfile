# Version 0.1.0

FROM centos:cst

MAINTAINER xshumeng xue.shumeng@yahoo.com

RUN curl https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo -o /etc/yum.repos.d/shadowsocks.repo && \
	yum -y install epel-release && \
	yum -y update && \
	yum -y install gcc gettext autoconf libtool automake make pcre-devel asciidoc \
	xmlto c-ares-devel libev-devel libsodium-devel mbedtls-devel shadowsocks-libev && \
	yum clean all && \
	mkdir /docker-entrypoint-init.d

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
