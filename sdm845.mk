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

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

PRODUCT_BOOT_JARS += tcmiface

# Video codec configuration files
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/qcom/sdm845/media_profiles.xml:system/etc/media_profiles.xml \
    device/qcom/sdm845/media_codecs.xml:system/etc/media_codecs.xml
    device/qcom/sdm845/media_codecs_performance.xml:system/etc/media_codecs_performance.xml
endif #TARGET_ENABLE_QC_AV_ENHANCEMENTS

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
