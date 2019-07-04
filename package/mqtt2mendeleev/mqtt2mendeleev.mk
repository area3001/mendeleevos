################################################################################
#
# mqtt2mendeleev
#
################################################################################

MQTT2MENDELEEV_VERSION = b22c364eecd7bd9e43a0a56dcd56684a8f8309a1
MQTT2MENDELEEV_SITE = $(call github,area3001,mqtt2mendeleev,$(MQTT2MENDELEEV_VERSION))
MQTT2MENDELEEV_LICENSE = MIT
MQTT2MENDELEEV_LICENSE_FILES = LICENSE
MQTT2MENDELEEV_DEPENDENCIES = \
	libmendeleev \
	mosquitto \

define MQTT2MENDELEEV_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) VERSION=$(MQTT2MENDELEEV_VERSION) -C $(@D)
endef

define MQTT2MENDELEEV_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR) PREFIX=/usr INSTOPTS=""
endef

define MQTT2MENDELEEV_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(MQTT2MENDELEEV_PKGDIR)/S90mqtt2mendeleev.sh \
    $(TARGET_DIR)/etc/init.d/S90mqtt2mendeleev.sh
endef

$(eval $(generic-package))
