################################################################################
#
# libmendeleev
#
################################################################################

LIBMENDELEEV_VERSION = 6791e41e3eaea84ba44952816a3730ce60432bb7
LIBMENDELEEV_SITE = $(call github,area3001,libmendeleev,$(LIBMENDELEEV_VERSION))
LIBMENDELEEV_LICENSE = LGPL-2.1+
LIBMENDELEEV_LICENSE_FILES = COPYING.LESSER
LIBMENDELEEV_INSTALL_STAGING = YES
LIBMENDELEEV_AUTORECONF = YES

$(eval $(autotools-package))
