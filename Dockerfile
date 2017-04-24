FROM samuelololol/docker-gentoo-websync
MAINTAINER samuelololol <samuelololol@gmail.com>
RUN echo "app-portage/layman git mercurial sqlite subversion" >> /etc/portage/package.use/package.use
RUN emerge -uv layman
#RUN mkdir -p /usr/local/portage/{metadata,profiles}
COPY portage /usr/local/portage
RUN chown -R portage:portage /usr/local/portage

RUN echo 'localrepo' > /usr/local/portage/profiles/repo_name
RUN echo 'masters = gentoo' >> /usr/local/portage/metadata/layout.conf
RUN echo 'auto-sync = false' >> /usr/local/portage/metadata/layout.conf

RUN echo '[localrepo]' >> /etc/portage/repos.conf/localrepo.conf
RUN echo 'location = /usr/local/portage' >> /etc/portage/repos.conf/localrepo.conf
