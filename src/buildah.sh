container=$(buildah from kubetalks/kubetalks-httpd)
buildah run ${container} dnf install -y texlive
wget https://github.com/jgm/pandoc/releases/download/2.9.2/pandoc-2.9.2-linux-amd64.tar.gz -O /tmp/pandoc.tar.gz
(cd /tmp; tar zxf pandoc.tar.gz)
buildah copy ${container} /tmp/pandoc-2.9.2/bin /usr/local/bin
buildah commit ${container} kubetalks/pandoc
buildah images
buildah inspect ${container}
podman run kubetalks/pandoc pandoc --version