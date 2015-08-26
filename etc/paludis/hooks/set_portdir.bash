#!/bin/bash

# set PORTDIR

source "${PALUDIS_EBUILD_DIR}/die_functions.bash"

PORTDIR="$(${CAVE} print-repository-metadata --format '%v' --raw-name location gentoo)"

if [[ -z ${PORTDIR} || "$(dirname ${PORTDIR})" == "/" ]] ; then
	die "PORTDIR empty or pointing to root!"
elif [[ ! -e ${PORTDIR} ]] ; then
	die "${PORTDIR} does not exist!"
fi
