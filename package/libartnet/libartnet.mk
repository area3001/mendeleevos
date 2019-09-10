################################################################################
#
# libartnet
#
################################################################################

LIBARTNET_VERSION = 61878f911f10f22d8ce109324faa345408dbb2c5
LIBARTNET_SITE = $(call github,OpenLightingProject,libartnet,$(LIBARTNET_VERSION))
LIBARTNET_LICENSE = LGPL-2.1+
LIBARTNET_LICENSE_FILES = COPYING
LIBARTNET_INSTALL_STAGING = YES
LIBARTNET_INSTALL_TARGET = YES
LIBARTNET_AUTORECONF = YES

define LIBARTNET_POST_PATCH_FIXUP
	mkdir $(@D)/config
endef
LIBARTNET_POST_PATCH_HOOKS += LIBARTNET_POST_PATCH_FIXUP

$(eval $(autotools-package))
