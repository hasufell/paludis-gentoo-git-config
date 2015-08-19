#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"

eend_die() {
	eend "$@"
	[[ $1 -ne 0 ]] && exit $1
}

print_ebuild_repositories() {
	local i
	for i in $(${CAVE} print-repositories) ; do
		[[ "$(${CAVE} print-repository-metadata --format "%v" --raw-name format $i)" == "e" ]] &&
			echo $i
	done
}
