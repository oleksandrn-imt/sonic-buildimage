BFN_SAI = bfnsdk_1.0.0_amd64.deb
$(BFN_SAI)_URL = "https://github.com/InterfaceMasters/sonic-release-pkgs/raw/imt-bf-sde-9.6.0/sonic-barefoot-pkgs/$(BFN_SAI)"

$(BFN_SAI)_DEPENDS += $(LIBNL_GENL3_DEV)
$(eval $(call add_conflict_package,$(BFN_SAI),$(LIBSAIVS_DEV)))
$(BFN_SAI)_RDEPENDS += $(LIBNL_GENL3)

SONIC_ONLINE_DEBS += $(BFN_SAI)
$(BFN_SAI_DEV)_DEPENDS += $(BFN_SAI)
