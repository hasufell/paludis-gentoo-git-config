#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"

PORTDIR="/usr/portage"

[[ -z ${PORTDIR} || "$(dirname ${PORTDIR})" == "/" ]] && die "PORTDIR empty or pointing to root!"


die() {
	eerror "${1}"
	exit 1
}

cd "${PORTDIR}"/metadata || die "could not cd into '${PORTDIR}/metadata'!"
[[ -e "${PORTDIR}"/metadata/herds.xml ]] && { rm "${PORTDIR}"/metadata/herds.xml || die "failed to rm herds.xml!" ;}
wget https://gitweb.gentoo.org/proj/api.git/plain/files/packages/herds.xml || die "failed to wget herds.xml"
