#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "${PALUDIS_EBUILD_DIR}/die_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"


einfo "syncing metadata cache"
egencache --jobs=8 --repo=gentoo --update --update-use-local-desc || die "egencache failed!"
