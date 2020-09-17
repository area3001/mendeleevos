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

$(eval $(python-package))