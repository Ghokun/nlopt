FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
 && apt install -y --no-install-recommends \
                build-essential \
                cmake \
                git \
                ca-certificates \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://github.com/stevengj/nlopt.git \
 && cd nlopt \
 && mkdir build \
 && cd build \
 && cmake -D NLOPT_PYTHON=OFF \
          -D NLOPT_OCTAVE=OFF \
          -D NLOPT_MATLAB=OFF \
          -D NLOPT_GUILE=OFF \
          -D NLOPT_SWIG=OFF \
          .. \
 && make \
 && make install \
 && ldconfig \
 && rm -rf /opt/nlopt \
 && rm -rf /tmp/*

CMD "/bin/bash"
