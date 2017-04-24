FROM samuelololol/docker-gentoo-websync
MAINTAINER samuelololol <samuelololol@gmail.com>
RUN echo "app-portage/layman git mercurial sqlite subversion" >> /etc/portage/package.use/package.use
RUN emerge -uv layman
