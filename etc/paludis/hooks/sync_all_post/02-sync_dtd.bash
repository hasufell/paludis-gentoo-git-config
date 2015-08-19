#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"

DTDDIR=${PORTDIR}/metadata/dtd
ebegin "Updating DTDs"
if [[ -e ${DTDDIR} ]]; then
	git -C "${DTDDIR}" pull -q --ff
else
	git clone -q https://anongit.gentoo.org/git/data/dtd.git "${DTDDIR}"
fi
eend "$?"
