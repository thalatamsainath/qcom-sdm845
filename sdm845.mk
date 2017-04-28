$(call inherit-product, device/qcom/common/common64.mk)

PRODUCT_NAME := sdm845
PRODUCT_DEVICE := sdm845
PRODUCT_BRAND := Android
PRODUCT_MODEL := SDM845 for arm64

#Initial bringup flags
TARGET_USES_AOSP := true
TARGET_USES_AOSP_FOR_AUDIO := true
TARGET_USES_QCOM_BSP := false

#Default vendor image configuration
ifeq ($(ENABLE_VENDOR_IMAGE),)
ENABLE_VENDOR_IMAGE := false
endif
ifeq ($(ENABLE_VENDOR_IMAGE), true)
#Comment on msm8998 tree says that QTIC does not
# yet support system/vendor split. So disabling it
# for sdm845 as well
TARGET_USES_QTIC := false

endif
TARGET_KERNEL_VERSION := 4.9
# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

# WLAN chipset
WLAN_CHIPSET := qca_cld3

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

PRODUCT_BOOT_JARS += tcmiface

# Video codec configuration files
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/qcom/sdm845/media_profiles.xml:system/etc/media_profiles.xml \
    device/qcom/sdm845/media_codecs.xml:system/etc/media_codecs.xml
    device/qcom/sdm845/media_codecs_performance.xml:system/etc/media_codecs_performance.xml
endif #TARGET_ENABLE_QC_AV_ENHANCEMENTS

PRODUCT_PACKAGES += android.hardware.media.omx@1.0-impl

# Audio configuration file
-include $(TOPDIR)hardware/qcom/audio/configs/sdm845/sdm845.mk

PRODUCT_PACKAGES += fs_config_files

#A/B related packages
PRODUCT_PACKAGES += update_engine \
    update_engine_client \
    update_verifier \
    bootctrl.sdm845 \
    brillo_update_payload \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

#Boot control HAL test app
PRODUCT_PACKAGES_DEBUG += bootctl

#Healthd packages
PRODUCT_PACKAGES += \
    android.hardware.health@1.0-impl \
    android.hardware.health@1.0-convert \
    android.hardware.health@1.0-service \
    libhealthd.msm

# Adding vendor manifest
PRODUCT_COPY_FILES += \
    device/qcom/sdm845/vintf.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml

# Display/Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    android.hardware.configstore@1.0-service


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
