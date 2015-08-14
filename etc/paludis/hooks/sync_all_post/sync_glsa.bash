#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "${PALUDIS_EBUILD_DIR}/die_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"


cd "${PORTDIR}"/metadata || die "could not cd into '${PORTDIR}/metadata'!"
if [[ -e glsa ]] ; then
	einfo "glsa dir already exists, updating..."
	cd glsa || die "could not cd into 'glsa'!"
	git pull --ff || die "could not pull updates!"
else
	einfo "glsa directory does not exist, cloning..."
	git clone https://anongit.gentoo.org/git/data/glsa.git || die "could not clone repository!"
fi

