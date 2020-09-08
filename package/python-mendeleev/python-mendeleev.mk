################################################################################
#
# python-mendeleev
#
################################################################################

PYTHON_MENDELEEV_VERSION = b968806e81a0098050c1ec704939d99de5fb7334
PYTHON_MENDELEEV_SITE = $(call github,area3001,pymendeleev,$(PYTHON_MENDELEEV_VERSION))
PYTHON_MENDELEEV_LICENSE = MIT
PYTHON_MENDELEEV_LICENSE_FILES = LICENSE
PYTHON_MENDELEEV_SETUP_TYPE = setuptools

$(eval $(python-package))