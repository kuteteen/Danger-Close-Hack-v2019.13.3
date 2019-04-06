ARCHS = arm64
TARGET = iphone:clang:latest:latest
THEOS_PACKAGE_DIR_NAME = debs
CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DangerCloseHack
DISPLAY_NAME = DangerCloseHack
DangerCloseHack_FRAMEWORKS = UIKit
DangerCloseHack_FILES = Tweak.xm $(wildcard *.m) $(shell find $(THEOS)/include/SCLAlertView -name '*.m')
DangerCloseHack_LDFLAGS += -Wl,-segalign,4000,-lstdc++
DangerCloseHack_CFLAGS ?= -DALWAYS_INLINE=1 -Os -std=c++11 -w -s


include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS)/makefiles/aggregate.mk



