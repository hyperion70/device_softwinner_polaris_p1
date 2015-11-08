# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_tablet_wifionly.mk)
LOCAL_PATH := device/softwinner/polaris_p1

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS :=  $(LOCAL_PATH)/overlay
PRODUCT_CHARACTERISTICS := tablet

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

include $(call all-makefiles-under,$(LOCAL_PATH))

# WiFi
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

#egl
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/egl/egl.cfg:system/lib/egl/egl.cfg \
	$(LOCAL_PATH)/egl/gralloc.sun8i.so:system/lib/hw/gralloc.sun8i.so \
	$(LOCAL_PATH)/egl/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
	$(LOCAL_PATH)/egl/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
	$(LOCAL_PATH)/egl/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \
	$(LOCAL_PATH)/egl/libMali.so:system/lib/libMali.so \
	$(LOCAL_PATH)/rootdir/sensors.sh:system/bin/sensors.sh

#key and tp config file
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/sunxi-keyboard.kl:system/usr/keylayout/sunxi-keyboard.kl \
	$(LOCAL_PATH)/configs/tp.idc:system/usr/idc/tp.idc \
	$(LOCAL_PATH)/configs/gsensor.cfg:system/usr/gsensor.cfg

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.sun8i:root/fstab.sun8i \
	$(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.sun8i.rc:root/init.recovery.sun8i.rc \
    $(LOCAL_PATH)/rootdir/initlogo.rle:root/initlogo.rle \
    $(LOCAL_PATH)/rootdir/init.sun8i.rc:root/init.sun8i.rc \
    $(LOCAL_PATH)/_prebuilt/system/vendor/modules/nand.ko:root/nand.ko \
    $(LOCAL_PATH)/rootdir/init.sun8i.usb.rc:root/init.sun8i.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sun8i.rc:root/ueventd.sun8i.rc

PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/rootdir/res,root/res)

# Ramdisk recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/_prebuilt/system/vendor/modules/disp.ko:recovery/root/disp.ko \
    $(LOCAL_PATH)/_prebuilt/system/vendor/modules/gslX680.ko:recovery/root/gslX680.ko \
    $(LOCAL_PATH)/_prebuilt/system/vendor/modules/gt818_ts.ko:recovery/root/gt818_ts.ko \
    $(LOCAL_PATH)/_prebuilt/system/vendor/modules/lcd.ko:recovery/root/lcd.ko \
    $(LOCAL_PATH)/_prebuilt/system/vendor/modules/nand.ko:recovery/root/nand.ko \
    $(LOCAL_PATH)/_prebuilt/system/vendor/modules/sunxi-keyboard.ko:recovery/root/sunxi-keyboard.ko \
    $(LOCAL_PATH)/_prebuilt/system/vendor/modules/sw-device.ko:recovery/root/sw-device.ko \
    $(LOCAL_PATH)/rootdir/fstab.sun8i:recovery/root/fstab.sun8i \
    $(LOCAL_PATH)/rootdir/init.recovery.sun8i.rc:recovery/root/init.recovery.sun8i.rc \
    $(LOCAL_PATH)/rootdir/initlogo.rle:recovery/root/initlogo.rle \
    $(LOCAL_PATH)/rootdir/ueventd.sun8i.rc:recovery/root/ueventd.sun8i.rc

# ext4 filesystem utils
PRODUCT_PACKAGES += \
	e2fsck \
	libext2fs \
	libext2_blkid \
	libext2_uuid \
	libext2_profile \
	libext2_com_err \
	libext2_e2p \
	make_ext4fs

PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.primary.polaris \
	audio.r_submix.default

PRODUCT_PACKAGES += \
	libfacedetection

# exdroid HAL
PRODUCT_PACKAGES += \
   lights.polaris \
   camera.polaris \
   sensors.polaris \
   hwcomposer.polaris \
   libion

# camera
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/camera.cfg:system/etc/camera.cfg \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml

# Gps
PRODUCT_PACKAGES += gps.polaris
BOARD_USES_GPS_TYPE := simulator
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml

# System Configuration
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=120 \
	persist.sys.timezone=Europe/Moscow \
	persist.sys.language=ru \
	persist.sys.country=RU

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Copy all files from prebuilts
$(shell $(LOCAL_PATH)/create_prebuilt_files_mk.sh > $(LOCAL_PATH)/PrebuiltFiles.mk)
include $(LOCAL_PATH)/PrebuiltFiles.mk

# Build
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=4PDA_tablet TARGET_DEVICE=polaris_p1
