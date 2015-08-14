#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "${PALUDIS_EBUILD_DIR}/die_functions.bash"

PORTDIR="/usr/portage"

[[ -z ${PORTDIR} || "$(dirname ${PORTDIR})" == "/" ]] && die "PORTDIR empty or pointing to root!"


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
cp -a */* . || die "could not copy news dirs to base news dir!"
