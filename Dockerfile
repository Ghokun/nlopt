FROM ubuntu:18.04
LABEL maintainer="ghokun.github.io"

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && apt-get install -qq -y --no-install-recommends \
            build-essential \
            cmake \
            git \
            ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/*

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

CMD ["/bin/bash"]
