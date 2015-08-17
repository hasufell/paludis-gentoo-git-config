#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"

eend_die() {
	eend "$@"
	[[ $1 -ne 0 ]] && exit $1
}
