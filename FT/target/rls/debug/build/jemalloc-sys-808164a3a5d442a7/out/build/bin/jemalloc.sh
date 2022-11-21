#!/bin/sh

prefix=/Users/haitran/Hackathon_NEAR/NEAR_COURCE_K2/nft-marketplace-tutorial/FT/target/rls/debug/build/jemalloc-sys-808164a3a5d442a7/out
exec_prefix=/Users/haitran/Hackathon_NEAR/NEAR_COURCE_K2/nft-marketplace-tutorial/FT/target/rls/debug/build/jemalloc-sys-808164a3a5d442a7/out
libdir=${exec_prefix}/lib

DYLD_INSERT_LIBRARIES=${libdir}/libjemalloc.2.dylib
export DYLD_INSERT_LIBRARIES
exec "$@"
