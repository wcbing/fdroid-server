FROM registry.gitlab.com/fdroid/docker-executable-fdroidserver:master

RUN curl -o androguard.deb http://ftp.cn.debian.org/debian/pool/main/a/androguard/androguard_3.4.0~a1-17_all.deb && \
	apt install ./androguard.deb

ENTRYPOINT ["sh", "-c", ". /etc/profile.d/bsenv.sh && GRADLE_USER_HOME=${home_vagrant}/.gradle ${fdroidserver}/fdroid \"$@\"", "-s"]
CMD ["--help"]