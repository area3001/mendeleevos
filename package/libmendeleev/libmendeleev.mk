################################################################################
#
# libmendeleev
#
################################################################################

LIBMENDELEEV_VERSION = r10
# LIBMENDELEEV_SITE = https://github.com/area3001/libmendeleev.git
# LIBMENDELEEV_SITE_METHOD = git
LIBMENDELEEV_SITE = /home/bert/area3001/libmendeleev
LIBMENDELEEV_SITE_METHOD = local
LIBMENDELEEV_LICENSE = LGPL-2.1+
LIBMENDELEEV_LICENSE_FILES = COPYING.LESSER
LIBMENDELEEV_INSTALL_STAGING = YES

$(eval $(autotools-package))
