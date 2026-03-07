PRJ_NATIVE_MK_FILE	:= $(realpath $(lastword $(MAKEFILE_LIST)))
PRJ_NATIVE_MK_DIR	:= $(shell dirname $(PRJ_NATIVE_MK_FILE))

I_HDD00			:= $(HOME)/iHDD00
MK_RACCOON_DIR		:= $(I_HDD00)/08.PROJECT/mk-raccoon

HOST_ARCH		:= $(shell uname -m)
TARGET_ARCH		?= $(HOST_ARCH)

GDB_REMOTE_PORT_x86_64	:= 2331
GDB_REMOTE_PORT_aarch64	:= 5531
GDB_REMOTE_PORT_riscv64	:= 6631

GDB_REMOTE_PORT		:= $(GDB_REMOTE_PORT_$(TARGET_ARCH))

BINDIR			:= bin/$(HOST_ARCH)
OBJDIR			:= obj/$(HOST_ARCH)

CFLAGS			+= -DHOST_ARCH$(HOST_ARCH)
CFLAGS			+= -Wextra
CFLAGS			+= -Wno-unused-parameter
CFLAGS			+= -Wno-unused-result

OPT			?= 0

include $(MK_RACCOON_DIR)/gcc_native.mk

prj_clean:
	rm -rf bin
	rm -rf obj

clean: prj_clean
