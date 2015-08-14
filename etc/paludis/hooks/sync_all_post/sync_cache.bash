#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"

PORTDIR="/usr/portage"

[[ -z ${PORTDIR} || "$(dirname ${PORTDIR})" == "/" ]] && die "PORTDIR empty or pointing to root!"


die() {
	eerror "${1}"
	exit 1
}

einfo "syncing metadata cache"
egencache --jobs=8 --repo=gentoo --update --update-use-local-desc || die "egencache failed!"
