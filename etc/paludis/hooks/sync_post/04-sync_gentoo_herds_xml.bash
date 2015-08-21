#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"

if [[ ${TARGET} == gentoo ]] ; then
	ebegin "Updating herds.xml"
	wget -q -O "${PORTDIR}"/metadata/herds.xml https://api.gentoo.org/packages/herds.xml
	eend $?
fi
