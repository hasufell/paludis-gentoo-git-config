#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"

GLSADIR=${PORTDIR}/metadata/glsa
ebegin "Updating GLSAs"
if [[ -e ${GLSADIR} ]]; then
	git -C "${GLSADIR}" pull --ff
else
	git clone https://anongit.gentoo.org/git/data/glsa.git "${GLSADIR}"
fi
eend "$?"
