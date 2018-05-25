

SDK_SERVER = https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x
SDK_PACKAGE = nRF5_SDK_15.0.0_a53641a
SDK_PACKAGE_SRC = $(SDK_PACKAGE).zip

PACKAGE_CACHE_SERVER	= http://git-hw/packages

WGET =  wget --tries=2 --continue --timeout=15 --waitretry=3
WGET += --no-check-certificate
RM			= rm -f
RM_RECURSIVE		= rm -rf

define sdk-download
	@if [ ! -d $(SDK_PACKAGE) ]; then \
		if [ ! -f $(SDK_PACKAGE_SRC) ]; then \
		echo "Downloadig package: $(SDK_PACKAGE_SRC)"; \
		$(WGET) $(SDK_SERVER)/$(SDK_PACKAGE_SRC) || exit; \
		fi \
	else \
		echo "SDK available: $(SDK_PACKAGE)"; \
	fi
endef

define sdk-extract
	@if [ ! -d $(SDK_PACKAGE) ]; then \
		if [ -f $(SDK_PACKAGE_SRC) ]; then \
			echo "Extracting package: $(SDK_PACKAGE_SRC)"; \
			unzip $(SDK_PACKAGE_SRC); \
			$(RM) $(SDK_PACKAGE_SRC); \
		fi \
	fi
endef

.PHONY: all

all: print-banner
	$(sdk-download)
	$(sdk-extract)
	@echo "================================================================================="

print-banner:
	@echo "================================================================================="
	@echo "Preparing SDK: $(SDK_PACKAGE)"

clean:
	@$(RM_RECURSIVE) $(SDK_PACKAGE)

