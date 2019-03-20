################################################################################
#
# libmendeleev
#
################################################################################

LIBMENDELEEV_VERSION = 030dcf9baf2cec38716d5264f753073140d44553
LIBMENDELEEV_SITE = $(call github,area3001,libmendeleev,$(LIBMENDELEEV_VERSION))
LIBMENDELEEV_LICENSE = LGPL-2.1+
LIBMENDELEEV_LICENSE_FILES = COPYING.LESSER
LIBMENDELEEV_INSTALL_STAGING = YES
LIBMENDELEEV_AUTORECONF = YES

$(eval $(autotools-package))
