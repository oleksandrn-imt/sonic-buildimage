BFN_SAI = bfnsdk_1.0.0_amd64.deb
$(BFN_SAI)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.0.0/sonic-barefoot-pkgs/$(BFN_SAI)"

SONIC_ONLINE_DEBS += $(BFN_SAI)
$(BFN_SAI_DEV)_DEPENDS += $(BFN_SAI)
