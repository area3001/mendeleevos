################################################################################
#
# libmendeleev
#
################################################################################

LIBMENDELEEV_VERSION = b968806e81a0098050c1ec704939d99de5fb7334
LIBMENDELEEV_SITE = $(call github,area3001,libmendeleev,$(LIBMENDELEEV_VERSION))
LIBMENDELEEV_LICENSE = LGPL-2.1+
LIBMENDELEEV_LICENSE_FILES = COPYING.LESSER
LIBMENDELEEV_INSTALL_STAGING = YES
LIBMENDELEEV_AUTORECONF = YES

$(eval $(autotools-package))
