################################################################################
#
# artnet2mendeleev
#
################################################################################

ARTNET2MENDELEEV_VERSION = 9520bcd75038b246d75a300987593d5083765f7b
ARTNET2MENDELEEV_SITE = $(call github,area3001,artnet2mendeleev,$(ARTNET2MENDELEEV_VERSION))
ARTNET2MENDELEEV_LICENSE = MIT
ARTNET2MENDELEEV_LICENSE_FILES = LICENSE
ARTNET2MENDELEEV_DEPENDENCIES = \
	libartnet \
	mosquitto
ARTNET2MENDELEEV_AUTORECONF = YES

define ARTNET2MENDELEEV_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(ARTNET2MENDELEEV_PKGDIR)/S80artnet2mendeleev.sh \
    $(TARGET_DIR)/etc/init.d/S80artnet2mendeleev.sh
endef

define ARTNET2MENDELEEV_POST_PATCH_FIXUP
  mkdir $(@D)/config
endef
ARTNET2MENDELEEV_POST_PATCH_HOOKS += ARTNET2MENDELEEV_POST_PATCH_FIXUP

$(eval $(autotools-package))
