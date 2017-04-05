$(call inherit-product, device/qcom/common/common64.mk)

PRODUCT_NAME := sdm845
PRODUCT_DEVICE := sdm845
PRODUCT_BRAND := Android
PRODUCT_MODEL := SDM845 for arm64

#Initial bringup flags
TARGET_USES_AOSP := true
TARGET_USES_AOSP_FOR_AUDIO := true
TARGET_USES_QCOM_BSP := false

TARGET_KERNEL_VERSION := 4.9
# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

# WLAN chipset
WLAN_CHIPSET := qca_cld3

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

PRODUCT_BOOT_JARS += tcmiface

# Audio configuration file
-include $(TOPDIR)hardware/qcom/audio/configs/sdm845/sdm845.mk

PRODUCT_PACKAGES += fs_config_files

#A/B related packages
PRODUCT_PACKAGES += update_engine \
    update_engine_client \
    update_verifier \
    bootctrl.sdm845 \
    brillo_update_payload
#Boot control HAL test app
PRODUCT_PACKAGES_DEBUG += bootctl

# Adding vendor manifest
PRODUCT_COPY_FILES += \
    device/qcom/sdm845/vintf.xml:system/vendor/manifest.xml

# Gralloc
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl

# HW Composer
PROCUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service

#Keymaster
PRODUCT_PACKAGES += android.hardware.keymaster@3.0-impl

# WLAN host driver
ifneq ($(WLAN_CHIPSET),)
PRODUCT_PACKAGES += $(WLAN_CHIPSET)_wlan.ko
endif

# WLAN driver configuration file
PRODUCT_COPY_FILES += \
    device/qcom/sdm845/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/qcom/sdm845/wifi_concurrency_cfg.txt:system/etc/wifi/wifi_concurrency_cfg.txt

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf
