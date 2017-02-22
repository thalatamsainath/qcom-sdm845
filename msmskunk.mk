$(call inherit-product, device/qcom/common/common64.mk)

PRODUCT_NAME := msmskunk
PRODUCT_DEVICE := msmskunk
PRODUCT_BRAND := Android
PRODUCT_MODEL := MSMSkunk for arm64

TARGET_KERNEL_VERSION := 4.8
# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

PRODUCT_BOOT_JARS += tcmiface

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msmskunk/audio_policy.conf:system/etc/audio_policy.conf \
    device/qcom/msmskunk/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/qcom/msmskunk/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/qcom/msmskunk/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
    device/qcom/msmskunk/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml

# Listen configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msmskunk/listen_platform_info.xml:system/etc/listen_platform_info.xml

PRODUCT_PACKAGES += fs_config_files
