This is not a full paludis configuration. It contains only those parts that are
necessary to set up a gentoo github mirror based sync system:
* configures paludis to sync via https://github.com/gentoo/gentoo.git
* updates metadata-cache (the first update might take long, all subsequent ones not)
* updates the dtd directory
* updates the glsa directory
* updates herds.xml
* updates the news directory

## Notes

If you want to sync all overlays additionally to the gentoo repository, you can
add the file `/etc/paludis/hooks/sync_post/06-sync_overlay_cache.bash` with the
following content:
```
#!/bin/bash

source "${PALUDIS_EBUILD_DIR}/echo_functions.bash"
source "/etc/paludis/hooks/set_portdir.bash"

if [[ ${TARGET} != gentoo && $(${CAVE} print-repository-metadata --raw-name format --format "%v" ${TARGET}) == e ]] ; then
	# Number of jobs for egencache, default is number or processors.
	egencache_jobnum="$(nproc)"

	ebegin "Cache update for repository ${TARGET}"
	egencache --jobs=${egencache_jobnum} --repo=${TARGET} --update --update-use-local-desc
	eend $?
fi
```
