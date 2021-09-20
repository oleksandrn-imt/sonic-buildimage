# BFN IMT platform modules

BFN_IMT_BK_VERSION = 3.01

export BFN_IMT_BK_VERSION

BFN_IMT_BK_MODULES = boardkeeper-modules_$(BFN_IMT_BK_VERSION)_amd64.deb
$(BFN_IMT_BK_MODULES)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.6.0/sonic-imt-boardkeeper-pkgs/$(BFN_IMT_BK_MODULES)"
$(BFN_IMT_BK_MODULES)_PLATFORM = x86_64-im_n29xx_t40n-r0
SONIC_ONLINE_DEBS += $(BFN_IMT_BK_MODULES)

BFN_IMT_BK_UTILS = boardkeeper-utils_$(BFN_IMT_BK_VERSION)_amd64.deb
$(BFN_IMT_BK_UTILS)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.6.0/sonic-imt-boardkeeper-pkgs/$(BFN_IMT_BK_UTILS)"
$(BFN_IMT_BK_UTILS)_PLATFORM = x86_64-im_n29xx_t40n-r0
SONIC_ONLINE_DEBS += $(BFN_IMT_BK_UTILS)

BFN_IMT_BK_UTILS_CFG = boardkeeper-utils-cfg_$(BFN_IMT_BK_VERSION)_amd64.deb
$(BFN_IMT_BK_UTILS_CFG)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.6.0/sonic-imt-boardkeeper-pkgs/$(BFN_IMT_BK_UTILS_CFG)"
$(BFN_IMT_BK_UTILS_CFG)_PLATFORM = x86_64-im_n29xx_t40n-r0
SONIC_ONLINE_DEBS += $(BFN_IMT_BK_UTILS_CFG)

IMT_FANCONTROL_CFG = fancontrol-config_3.01_all.deb
$(IMT_FANCONTROL_CFG)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.6.0/sonic-imt-boardkeeper-pkgs/$(IMT_FANCONTROL_CFG)"
SONIC_ONLINE_DEBS += $(IMT_FANCONTROL_CFG)

IMT_SENSORS_CFG = sensors-config_3.01_amd64.deb
$(IMT_SENSORS_CFG)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.6.0/sonic-imt-boardkeeper-pkgs/$(IMT_SENSORS_CFG)"
SONIC_ONLINE_DEBS += $(IMT_SENSORS_CFG)

BFN_IMT_PLATFORM_MODULE_VERSION = 1.0

export BFN_IMT_PLATFORM_MODULE_VERSION

BFN_IMT_PLATFORM_MODULE = sonic-platform-modules-imt_$(BFN_IMT_PLATFORM_MODULE_VERSION)_amd64.deb
$(BFN_IMT_PLATFORM_MODULE)_SRC_PATH = $(PLATFORM_PATH)/sonic-platform-modules-imt
$(BFN_IMT_PLATFORM_MODULE)_PLATFORM = x86_64-im_n29xx_t40n-r0
SONIC_DPKG_DEBS += $(BFN_IMT_PLATFORM_MODULE)
