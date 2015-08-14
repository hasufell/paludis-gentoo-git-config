#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "${PALUDIS_EBUILD_DIR}/die_functions.bash"

PORTDIR="/usr/portage"

[[ -z ${PORTDIR} || "$(dirname ${PORTDIR})" == "/" ]] && die "PORTDIR empty or pointing to root!"


cd "${PORTDIR}"/metadata || die "could not cd into '${PORTDIR}/metadata'!"
if [[ -e dtd ]] ; then
	einfo "dtd dir already exists, updating..."
	cd glsa || die "could not cd into 'dtd'!"
	git pull --ff || die "could not pull updates!"
else
	einfo "dtd directory does not exist, cloning..."
	git clone https://anongit.gentoo.org/git/data/dtd.git || die "could not clone repository!"
fi

