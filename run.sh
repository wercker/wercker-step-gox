#!/bin/bash

# Environmental variables 
XC_ARCH="$WERCKER_GOX_ARCH"  
XC_OS="$WERCKER_GOX_OS"
XC_LDFLAGS="$WERCKER_GOX_LDFLAGS"
XC_OUTPUT="$WERCKER_GOX_OUTPUT"
XC_DEST="$WERCKER_GOX_DEST"


XC_DEST=${XC_DEST:-$WERCKER_DEST_DIR/pkg}
XC_OUTPUT=${XC_OUTPUT:-"{{.OS}}_{{.Arch}}/{{.Dir}"}
XC_ARCH=${XC_ARCH:-386 amd64 arm}
XC_OS=${XC_OS:-darwin linux windows freebsd openbsd netbsd plan9}

gox \
    -os="${XC_OS}" \
    -arch="${XC_ARCH}" \
    -ldflags="${XC_LDFLAGS}"\
    -output "${XC_DEST}/${XC_OUTPUT}"

ls -l ${XC_DEST}
