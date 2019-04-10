################################################################################
#
# uart-enable-rs485
#
################################################################################

CFLAGS = $(TARGET_CFLAGS) -c -Wall -O2

define UART_ENABLE_RS485_BUILD_CMDS
	$(TARGET_CC) $(CFLAGS) \
		$(UART_ENABLE_RS485_PKGDIR)/main.c -o $(@D)/uart-enable-rs485.o
	$(TARGET_CC) $(@D)/uart-enable-rs485.o -o $(@D)/uart-enable-rs485
endef

define UART_ENABLE_RS485_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/uart-enable-rs485 $(TARGET_DIR)/usr/bin/uart-enable-rs485
endef

define UART_ENABLE_RS485_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(UART_ENABLE_RS485_PKGDIR)/S15enable-rs485.sh \
    $(TARGET_DIR)/etc/init.d/S15enable-rs485.sh
endef

$(eval $(generic-package))
