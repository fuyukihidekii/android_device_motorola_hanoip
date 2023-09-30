#
# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Device shipping API
PRODUCT_SHIPPING_API_LEVEL := 30

# Display
TARGET_SCREEN_DENSITY := 400

# Boot animation
TARGET_SCREEN_HEIGHT := 2460
TARGET_SCREEN_WIDTH := 1080

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Properties
-include $(LOCAL_PATH)/properties.mk

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Audio
PRODUCT_PACKAGES += \
    libgui_vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_awinic_snd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_awinic_snd.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-sp/libc++.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libc++.so

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Init
PRODUCT_PACKAGES += \
    init.mmi.overlay.rc \
    init.oem.fingerprint.sh \
    init.oem.fingerprint2.sh

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.hanoip

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/uinput_nav.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput_nav.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput_nav.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput_nav.kl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Build ID
BUILD_FINGERPRINT := "motorola/hanoip_retail/hanoip:12/S2RI32.32-20-9-9-2/5bf47:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hanoip_retail \
    PRIVATE_BUILD_DESC="hanoip_retail-user 12 S2RI32.32-20-9-9-2 1591b-5bf47 release-keys"

# Inherit from common SM6150 platform configuration.
$(call inherit-product, device/motorola/sm6150-common/common.mk)

# Inherit product proprietary files
$(call inherit-product, vendor/motorola/hanoip/hanoip-vendor.mk)
