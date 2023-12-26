#!/usr/bin/env bash

# Read Mode
MODE="$1"
echo "Building variant: $MODE"

# Fix GCC alternative assignment
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 100
update-alternatives --set gcc /usr/bin/gcc-9

# Fix G++ alternative assignment
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 100
update-alternatives --set g++ /usr/bin/g++-9

# Build function
cook() {
    make -j$(nproc --all) "$@" STARTUP_WINDOW=0 HAVE_GTK2=0
}

# Build variants
[ "$MODE" = "FURY" ] && cook FURY=1
[ "$MODE" = "EDUKE32" ] && cook

# HACK: Force success, we'll handle this somewhere else.
exit 0
