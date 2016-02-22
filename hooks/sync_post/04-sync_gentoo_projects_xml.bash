#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"

if [[ ${TARGET} == gentoo ]] ; then
	ebegin "Updating projects.xml"
	wget -q -P "${PORTDIR}"/metadata/ -N https://api.gentoo.org/metastructure/projects.xml
	eend $?
fi
