################################################################################
#
# mqtt2mendeleev
#
################################################################################

define PYMQTT2MENDELEEV_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(PYMQTT2MENDELEEV_PKGDIR)/mqtt2mendeleev.py $(TARGET_DIR)/usr/bin/mqtt2mendeleev.py
endef

define PYMQTT2MENDELEEV_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(PYMQTT2MENDELEEV_PKGDIR)/S90mqtt2mendeleev.sh \
		$(TARGET_DIR)/etc/init.d/S90mqtt2mendeleev.sh
endef

$(eval $(generic-package))
