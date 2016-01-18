#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"

if [[ ${TARGET} == gentoo ]] ; then
	# Number of jobs for egencache, default is number of processors.
	egencache_jobnum="$(nproc)"

	if [[ -f ${PORTDIR}/metadata/timestamp.x ]]; then
		portage_current_timestamp=$(cut -f 1 -d " " "${PORTDIR}/metadata/timestamp.x" )
	else
		portage_current_timestamp=0
	fi

	ebegin "Fetching metadata timestamp for ${TARGET}"
	rsync -aq rsync://rsync.gentoo.org/gentoo-portage/metadata/timestamp.x "${PORTDIR}"/metadata/timestamp.x
	eend $?
	portage_new_timestamp=$(cut -f 1 -d " " "${PORTDIR}/metadata/timestamp.x" )

	if [[ ${portage_current_timestamp} -lt ${portage_new_timestamp} ]]; then
		ebegin "Fetching pre-generated metadata cache for ${TARGET}"
		rsync -aq rsync://rsync.gentoo.org/gentoo-portage/metadata/md5-cache/ "${PORTDIR}"/metadata/md5-cache/
		eend $?
	else
		einfo "Metadata cache for ${TARGET} already recent, no need to fetch it :-)"
	fi

	ebegin "Updating metadata cache for repository ${TARGET}"
	egencache --jobs=${egencache_jobnum} --repo=${TARGET} --update --update-use-local-desc
	eend $?
fi
