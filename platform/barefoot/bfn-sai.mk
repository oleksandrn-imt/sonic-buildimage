BFN_SAI = bfnsdk_1.0.0_amd64.deb
$(BFN_SAI)_URL = "http://192.168.157.83/yuriih/barefoot/$(BFN_SAI)"

SONIC_ONLINE_DEBS += $(BFN_SAI)
$(BFN_SAI_DEV)_DEPENDS += $(BFN_SAI)
