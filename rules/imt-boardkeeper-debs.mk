IMT_BK_MODULES = boardkeeper-modules_3.01_amd64.deb
$(IMT_BK_MODULES)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.0.0/sonic-imt-boardkeeper-pkgs/$(IMT_BK_MODULES)"
SONIC_ONLINE_DEBS += $(IMT_BK_MODULES)

IMT_BK_UTILS = boardkeeper-utils_3.01_amd64.deb
$(IMT_BK_UTILS)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.0.0/sonic-imt-boardkeeper-pkgs/$(IMT_BK_UTILS)"
SONIC_ONLINE_DEBS += $(IMT_BK_UTILS)

IMT_FANCONTROL_CFG = fancontrol-config_3.01_all.deb
$(IMT_FANCONTROL_CFG)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.0.0/sonic-imt-boardkeeper-pkgs/$(IMT_FANCONTROL_CFG)"
SONIC_ONLINE_DEBS += $(IMT_FANCONTROL_CFG)

IMT_SENSORS_CFG = sensors-config_3.01_amd64.deb
$(IMT_SENSORS_CFG)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.0.0/sonic-imt-boardkeeper-pkgs/$(IMT_SENSORS_CFG)"
SONIC_ONLINE_DEBS += $(IMT_SENSORS_CFG)

SONIC_STRETCH_DEBS += $(IMT_BK_MODULES) $(IMT_BK_UTILS) $(IMT_FANCONTROL_CFG) $(IMT_SENSORS_CFG)

export IMT_BK_MODULES
export IMT_BK_UTILS
export IMT_FANCONTROL_CFG
export IMT_SENSORS_CFG
