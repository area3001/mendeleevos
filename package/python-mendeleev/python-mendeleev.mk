################################################################################
#
# python-mendeleev
#
################################################################################

PYTHON_MENDELEEV_VERSION = 588057d0974abed663fb104756504cae0764dead
PYTHON_MENDELEEV_SITE = $(call github,area3001,pymendeleev,$(PYTHON_MENDELEEV_VERSION))
PYTHON_MENDELEEV_LICENSE = MIT
PYTHON_MENDELEEV_LICENSE_FILES = LICENSE
PYTHON_MENDELEEV_SETUP_TYPE = setuptools

ifeq ($(BR2_PYMENDELEEV_INIT_SCRIPT),y)
define PYTHON_MENDELEEV_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(PYTHON_MENDELEEV_PKGDIR)/S90mqtt2mendeleev.sh \
		$(TARGET_DIR)/etc/init.d/S90mqtt2mendeleev.sh
endef
endif

$(eval $(python-package))