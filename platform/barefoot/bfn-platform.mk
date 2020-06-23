BFN_PLATFORM = bfnplatform_1.0.0_amd64.deb
$(BFN_PLATFORM)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.0.0/sonic-barefoot-pkgs/$(BFN_PLATFORM)"

SONIC_ONLINE_DEBS += $(BFN_PLATFORM)
$(BFN_SAI_DEV)_DEPENDS += $(BFN_PLATFORM)
