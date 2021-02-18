FROM debian:10

RUN apt-get update
RUN apt-get install -y sudo libusb-1.0-0-dev libmnl-dev python3

# dipendenze libosmocore
RUN apt-get install -y build-essential libtool libtalloc-dev libsctp-dev shtool autoconf automake git-core pkg-config make gcc gnutls-dev python-minimal libpcsclite-dev
# dipendenze osmocom-bb
RUN apt-get install -y libtool shtool automake autoconf git-core pkg-config make gcc
RUN apt -y install gcc-arm-none-eabi 

# libosmocore
WORKDIR /
RUN git clone git://git.osmocom.org/libosmocore.git
WORKDIR /libosmocore

RUN autoreconf -i
RUN ./configure
RUN make
RUN sudo make install
RUN sudo ldconfig -i

# osmocom-bb
WORKDIR /
RUN git clone git://git.osmocom.org/osmocom-bb.git
WORKDIR /osmocom-bb
RUN git pull --rebase

WORKDIR /osmocom-bb/src

RUN make
#RUN make -e CROSS_TOOL_PREFIX=arm-none-eabi-

# file in src/target/firmware/board/compal_e88/*.bin
# utility /osmocom-bb/src/host/osmocon/osmocon
