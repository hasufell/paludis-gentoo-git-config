#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "${PALUDIS_EBUILD_DIR}/die_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"


cd "${PORTDIR}"/metadata || die "could not cd into '${PORTDIR}/metadata'!"
if [[ -e news ]] ; then
	einfo "news dir already exists, updating..."
	cd news || die "could not cd into 'news'!"
	git pull --ff || die "could not pull updates!"
else
	einfo "glsa directory does not exist, cloning..."
	git clone https://anongit.gentoo.org/git/proj/gentoo-news.git news || die "could not clone repository!"
fi

cd "${PORTDIR}"/metadata/news || die "failed to cd into ${PORTDIR}/metadata/news"
git clean -fdxq || die "failed to clean git repo!"

if [[ -n "$(find . -mindepth 1 -maxdepth 1 -type d -name "*-*-*")" ]] ; then
	die "it seems the repository format of proj/gentoo-news has changed! Update your script!"
else
	cp -a */* . || die "could not copy news dirs to base news dir!"
fi
