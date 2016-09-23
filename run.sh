#! /bin/bash

pushd /scratch/neha/bitcoindir &&
     if [ "$(pwd)" == '/scratch/neha/bitcoindir' ];
     then
         git reset --hard && git clean -f -d
     fi
popd

LD_PRELOAD="/usr/lib/libprofiler.so" 
CPUPROFILE="~/data/profiles/b.prof" 
src/bitcoind -simulation -datadir=/scratch/neha/bitcoindir -simdatadir=/scratch/simdata -start=20160630 -end=20160701 -loadmempool=0 -disablewallet -debug=bench
