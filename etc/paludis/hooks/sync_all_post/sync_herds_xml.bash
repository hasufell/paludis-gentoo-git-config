#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"

ebegin "Updating herds.xml"
wget -O "${PORTDIR}"/metadata/herds.xml https://api.gentoo.org/packages/herds.xml
eend $?
