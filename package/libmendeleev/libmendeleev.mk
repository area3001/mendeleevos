################################################################################
#
# libmendeleev
#
################################################################################

LIBMENDELEEV_VERSION = 131f08aedc97aa56937c2efe82c731f1ebba9259
LIBMENDELEEV_SITE = $(call github,area3001,libmendeleev,$(LIBMENDELEEV_VERSION))
LIBMENDELEEV_LICENSE = LGPL-2.1+
LIBMENDELEEV_LICENSE_FILES = COPYING.LESSER
LIBMENDELEEV_INSTALL_STAGING = YES
LIBMENDELEEV_AUTORECONF = YES

$(eval $(autotools-package))
