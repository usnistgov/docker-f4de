FROM ubuntu:14.04
MAINTAINER Martial Michel
ENV F4DEftp ftp://jaguar.ncsl.nist.gov/pub/F4DE-3.2.2-20150422-1520Z.tar.bz2

# Make sure we have bash as our default shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Get the packages needed for Ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y install gnuplot-nox libxml2-utils wget rsync sqlite3 build-essential

# Install perlbrew
ENV PERLBREW_ROOT=/perl5
RUN bash -c '\wget -O - http://install.perlbrew.pl | bash' && /perl5/bin/perlbrew init && /perl5/bin/perlbrew install -j $(nproc) --64all --switch perl-5.16.3
ENV PATH=/perl5/bin:/perl5/perls/perl-5.16.3/bin:$PATH
ENV PERLBREW_PERL=perl-5.16.3
ENV PERLBREW_MANPATH=/perl5/perls/perl-5.16.3/man
ENV PERLBREW_PATH=/perl5/bin:/perl5/perls/perl-5.16.3/bin
ENV PERLBREW_SKIP_INIT=1

# Obtain F4DE & Install its perl packages
RUN wget $F4DEftp -O /tmp/F4DE.tbz2 && tar xfj /tmp/F4DE.tbz2 && mv F4DE-* F4DE && cd F4DE && cpanp s conf prereqs 1 && cpanp s save && make perl_install

# Run F4DE's core tests & Install
RUN cd /F4DE && make check && make install
ENV PATH=/F4DE/bin:$PATH

# Create a work dir
RUN mkdir /f4de_work
WORKDIR /f4de_work

# build with (adapt version number)
# % docker build --tag="martialnist/f4de:3.2.2" .

# use with (adapt <IMAGENAME> and directories)
# % docker run -t -i -v <INDIR>:/f4de_indir:ro -v <OUTDIR>:/f4de_outdir <IMAGENAME> /bin/bash