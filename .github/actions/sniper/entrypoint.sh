#!/usr/bin/env bash

# Read Mode
MODE="$1"
echo "Building variant: $MODE"

# Build function
cook() {
    make -j$(nproc --all) "$@" \
        STARTUP_WINDOW=0 HAVE_GTK2=0 HAVE_FLAC=0 USE_LIBVPX=0
}

# Build variants
[ "$MODE" = "FURY" ] && cook FURY=1
[ "$MODE" = "EDUKE32" ] && cook

# HACK: Force success, we'll handle this somewhere else.
exit 0
