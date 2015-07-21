ARCHS = armv7 arm64
THEOS_BUILD_DIR = Packages
include theos/makefiles/common.mk

TWEAK_NAME = ThinnerBanners
ThinnerBanners_FILES = Tweak.xm
ThinnerBanners_FRAMEWORKS = Foundation UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
