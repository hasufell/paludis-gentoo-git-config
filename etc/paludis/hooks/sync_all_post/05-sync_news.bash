#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"
source "/etc/paludis/hooks/util_functions.bash"

NEWSDIR="${PORTDIR}"/metadata/news
ebegin "Updating news items"
if [[ -e ${NEWSDIR} ]]; then
	git -C "${NEWSDIR}" pull -q --ff
else
	git clone -q https://anongit.gentoo.org/git/proj/gentoo-news.git "${NEWSDIR}"
fi
eend_die $?

ebegin "Cleaning news git repo"
git -C "${NEWSDIR}" clean -fdxq
eend_die $?

ebegin "Copying news to base directory"
cp -a "${NEWSDIR}"/*/* "${NEWSDIR}"
eend $?

