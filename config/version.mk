PRODUCT_VERSION_MAJOR = 13
PRODUCT_VERSION_MINOR = 0

FLOKO_VERSION := 7.0
CR_VERSION := $(FLOKO_VERSION)

# Increase CR Version with each major release.
CR_VERSION := 9.0

# Internal version
LINEAGE_VERSION := Floko-v$(FLOKO_VERSION)-$(LINEAGE_BUILD)-$(shell date -u +%Y%m%d)-DEBUG

# Display version
LINEAGE_DISPLAY_VERSION := Floko-v$(FLOKO_VERSION)-$(LINEAGE_BUILD)
