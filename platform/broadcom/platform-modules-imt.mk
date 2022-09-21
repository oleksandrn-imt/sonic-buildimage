# BCM IMT platform modules

BCM_IMT_BK_VERSION = 3.01

export BCM_IMT_BK_VERSION

BCM_IMT_BK_MODULES = boardkeeper-modules_$(BCM_IMT_BK_VERSION)_amd64.deb
$(BCM_IMT_BK_MODULES)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bcm-sai-5.0.0.6/sonic-imt-boardkeeper-pkgs/$(BCM_IMT_BK_MODULES)"
$(BCM_IMT_BK_MODULES)_PLATFORM = x86_64-im_n29xx_t40n-r0
SONIC_ONLINE_DEBS += $(BCM_IMT_BK_MODULES)

BCM_IMT_BK_UTILS = boardkeeper-utils_$(BCM_IMT_BK_VERSION)_amd64.deb
$(BCM_IMT_BK_UTILS)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bcm-sai-5.0.0.6/sonic-imt-boardkeeper-pkgs/$(BCM_IMT_BK_UTILS)"
$(BCM_IMT_BK_UTILS)_PLATFORM = x86_64-im_n29xx_t40n-r0
SONIC_ONLINE_DEBS += $(BCM_IMT_BK_UTILS)

BCM_IMT_BK_UTILS_CFG = boardkeeper-utils-cfg_$(BCM_IMT_BK_VERSION)_amd64.deb
$(BCM_IMT_BK_UTILS_CFG)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bcm-sai-5.0.0.6/sonic-imt-boardkeeper-pkgs/$(BCM_IMT_BK_UTILS_CFG)"
$(BCM_IMT_BK_UTILS_CFG)_PLATFORM = x86_64-im_n29xx_t40n-r0
SONIC_ONLINE_DEBS += $(BCM_IMT_BK_UTILS_CFG)

IMT_FANCONTROL_CFG = fancontrol-config_3.01_all.deb
$(IMT_FANCONTROL_CFG)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bcm-sai-5.0.0.6/sonic-imt-boardkeeper-pkgs/$(IMT_FANCONTROL_CFG)"
SONIC_ONLINE_DEBS += $(IMT_FANCONTROL_CFG)

IMT_SENSORS_CFG = sensors-config_3.01_amd64.deb
$(IMT_SENSORS_CFG)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bcm-sai-5.0.0.6/sonic-imt-boardkeeper-pkgs/$(IMT_SENSORS_CFG)"
SONIC_ONLINE_DEBS += $(IMT_SENSORS_CFG)
