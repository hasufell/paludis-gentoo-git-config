This is not a full paludis configuration. It contains only those parts that are
necessary to set up a gentoo github mirror based sync system:
* configures paludis to sync via https://github.com/gentoo/gentoo.git
* updates metadata-cache (the first update might take long, all subsequent once not)
* updates the dtd directory
* updates the glsa directory
* updates herds.xml
* updates the news directory
