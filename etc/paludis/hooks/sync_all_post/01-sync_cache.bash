#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"
source "/etc/paludis/hooks/util_functions.bash"

# You may change this to only update cache of specific repositories.
# Should at least include 'gentoo'. Default is all repositories.
repository_list=( $(print_ebuild_repositories) )

# Number of jobs for egencache, default is number or processors.
egencache_jobnum="$(nproc)"

ebegin "Fetching pre-generated metadata cache for gentoo repository"
rsync -aq rsync://rsync.gentoo.org/gentoo-portage/metadata/md5-cache/ "${PORTDIR}"/metadata/md5-cache/
eend $?

einfo "Updating metadata cache for repositories:"
for _repo in ${repository_list[@]} ; do
	ebegin "  ${_repo}"
	egencache --jobs=${egencache_jobnum} --repo=${_repo} --update --update-use-local-desc
	eend $?
done

