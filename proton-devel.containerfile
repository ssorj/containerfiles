FROM fedora

RUN dnf install git gcc-c++ cmake openssl-devel python-devel swig cyrus-sasl-devel cyrus-sasl-md5 cyrus-sasl-plain ruby-devel tox doxygen jsoncpp-devel python-sphinx rubygem-minitest

RUN git clone https://github.com/ssorj/qpid-proton.git

WORKDIR qpid-proton

# RUN git switch ssorj-data-codec

RUN mkdir bld

WORKDIR bld

RUN cmake ..

RUN make -j16

RUN make test
