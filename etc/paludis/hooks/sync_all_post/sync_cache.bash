#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"

# add your overlays here (name of the overlay!)
overlay_list=(
)

ebegin "Syncing metadata cache for gentoo repository"
rsync -avPq rsync://rsync.gentoo.org/gentoo-portage/metadata/md5-cache/ "${PORTDIR}"/metadata/md5-cache/
egencache --jobs=$(nproc) --repo=gentoo --update --update-use-local-desc
eend $?

if [[ ${#overlay_list[@]} -gt 0 ]] ; then
	ebegin "Syncing metadata cache for overlays"
	for _overlay in ${overlay_list[@]} ; do
		einfo "  ${_overlay}"
		egencache --jobs=$(nproc) --repo=${_overlay} --update --update-use-local-desc
	done
	eend $?
fi
