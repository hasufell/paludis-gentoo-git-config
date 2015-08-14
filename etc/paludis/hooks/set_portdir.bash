#!/bin/bash

# set PORTDIR

PORTDIR="$(cave print-repository-metadata --raw-name location gentoo)"
PORTDIR="${PORTDIR#location=}"

if [[ -z ${PORTDIR} || "$(dirname ${PORTDIR})" == "/" ]] ; then
	die "PORTDIR empty or pointing to root!"
elif [[ ! -e ${PORTDIR} ]] ; then
	die "${PORTDIR} does not exist!"
fi
