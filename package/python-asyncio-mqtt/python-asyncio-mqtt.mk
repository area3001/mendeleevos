################################################################################
#
# python-asyncio-mqtt
#
################################################################################

PYTHON_ASYNCIO_MQTT_VERSION = 0.16.1
PYTHON_ASYNCIO_MQTT_SOURCE = asyncio_mqtt-$(PYTHON_ASYNCIO_MQTT_VERSION).tar.gz
PYTHON_ASYNCIO_MQTT_SITE = https://files.pythonhosted.org/packages/b9/ae/bb75e07de548e883ef0b813f139613f13ac43e79874b1365af21572a7eaa
PYTHON_ASYNCIO_MQTT_SETUP_TYPE = setuptools
PYTHON_ASYNCIO_MQTT_LICENSE = BSD3
PYTHON_ASYNCIO_MQTT_LICENSE_FILES = LICENSE

$(eval $(python-package))
