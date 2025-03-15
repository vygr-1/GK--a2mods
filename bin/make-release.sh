#!/usr/bin/env bash
# Create a release file for Anduril .hex files.
# Copyright (C) 2023 Selene ToyKeeper
# SPDX-License-Identifier: GPL-3.0-or-later

set -e  # abort on error



    # 2025-03-10
    echo "    "
    echo "  make-release.sh "
    echo "  Zip up all .hex files to prep for publishing a release "



# run from repo root
# REPODIR=$(dirname "$0")/..
REPODIR=$(dirname "$0")/..
cd "$REPODIR"

    echo "    "
    echo "  -  run from repo root directory "





# get rid of 1st arg if it's "release" passed from 'make'
[[ "$1" = "release" ]] && shift

# try to get the repo ready for a release
# (or not; probably better to do these steps manually)
#make clean
#make





# release name
#  OG: REV=$(bin/version-string.sh git)
#  MOD:
#  REV=$(bin/version-string.sh)

# allow manually specifying a release name
[[ -n "$1" ]] && REV="$1"

# releases are named "$project.$revision"



#  2025-03-10
#  copied from a modded version-string.sh file
#  for compiling in WSL:
REVDATE=$( date '+%y.%m.%d..%H.%M' )  

### custom release name
RELNAME="a2.$REVDATE"

    # 2025-03-10
    echo "  -  release name      = RELNAME = $RELNAME "





# release directory
RELDIR="releases/$RELNAME"
mkdir -p "$RELDIR" "$RELDIR/hex"

    # 2025-03-10

    echo "  -  release directory = RELDIR  = "releases/$RELNAME" "
    echo "  -  hex directory     = "$RELDIR/hex" "





# add documentation and stuff
# cp -a \
    # ChangeLog.md \
    # LICENSE \
    # MODELS \
    # README.md \
    # docs/anduril-manual.md \
    # docs/battery-rainbow.png \
    # docs/which-hex-file.md \
    # "$RELDIR"


# cp -a MODELS "$RELDIR"
# cp -a README.md "$RELDIR"


# add documentation and stuff
cp -a ./ChangeLog.md ./LICENSE ./MODELS ./README.md ./docs/anduril-manual.md ./docs/which-hex-file.md "$RELDIR"



    # 2025-03-10
    echo "    "
    echo "  -  add documentation and stuff, copy some files into the RELDIR "





# add hardware-specific docs
for f in $(find hw -name '*.md') ; do
    d=$(echo "$f" | sed 's/^hw.//; s|/readme||i; s/^/readme./; s|/|-|g;')
    cp -a "$f" "$RELDIR/$d"
done


    # 2025-03-10
    echo "  -  add hardware-specific docs "





# add the .hex files
## rename -f 's|hex/anduril.|'"$RELDIR/hex/$RELNAME"'.|;' hex/*.hex

## 2025-03-10:
## add the .hex files
cp -a hex/*.hex "$RELDIR/hex"

    # 2025-03-10
    echo "    "
    echo "  -  copy the compiled ".hex" files from the "/hex" directory "
    echo "     into the "$RELDIR/hex" directory "
    echo "    "





# make a .zip file
cd releases
mkdir -p zip
ZPATH=zip/"$RELNAME".zip
zip -q -r "$ZPATH" "$RELNAME"
cd ..
ls -l "releases/$ZPATH"

    # 2025-03-10
    echo "    "
    echo "  -  make a .zip file in the "releases/zip" directory "

    # 2025-03-10
    echo "    "
    echo "     OK, IF YOU SEE THIS LINE, IT SEEMS LIKE EVERYTHING KINDA WORKS"
    echo "    "


