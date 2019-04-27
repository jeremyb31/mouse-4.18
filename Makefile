KVER ?= $(shell uname -r)
obj-m += elan_i2c.o

elan_i2c-objs := elan_i2c_core.o
elan_i2c-$(CONFIG_MOUSE_ELAN_I2C_I2C)	+= elan_i2c_i2c.o
elan_i2c-$(CONFIG_MOUSE_ELAN_I2C_SMBUS)	+= elan_i2c_smbus.o

 
all:
	make -C /lib/modules/$(KVER)/build M=$(PWD) modules
 
clean:
	make -C /lib/modules/$(KVER)/build M=$(PWD) clean

