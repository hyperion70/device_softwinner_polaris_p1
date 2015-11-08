LOCAL_PATH := device/softwinner/polaris_p1


# Target Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT_CPU := cortex-a7

TARGET_BOARD_PLATFORM := polaris
TARGET_BOOTLOADER_BOARD_NAME := polaris_p1
CEDARX_USE_ION_MEM_ALLOCATOR:=Y

# EGL stuff
BOARD_EGL_CFG := $(LOCAL_PATH)/egl/egl.cfg
COMMON_GLOBAL_CFLAGS += -DWORKAROUND_BUG_10194508
BOARD_EGL_WORKAROUND_BUG_10194508 := true
USE_OPENGL_RENDERER := true
ENABLE_WEBGL := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

# Workaround for no SYNC support
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# use our own init.rc
TARGET_PROVIDES_INIT_RC :=true

# Recovery
SW_BOARD_TOUCH_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.sun8i
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
DEVICE_RESOLUTION := 800x480
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
BOARD_UMS_2ND_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun1/file"

#CWM
RECOVERY_SDCARD_ON_DATA := false
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/by-name/UDISK
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/by-name/UDISK
BOARD_SDEXT_DEVICE := /dev/block/mmcblk0p1
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"

# no hardware camera
USE_CAMERA_STUB := true

# audio & camera & cedarx
CEDARX_CHIP_VERSION := F50
CEDARX_USE_SWAUDIO := Y

#widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# image related
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false


# Widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyS0,115200 rw init=/init loglevel=4 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40000000
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

# Memory
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 791674880
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1055916032

# Path define for God knows what
TARGET_HARDWARE_INCLUDE := $(TOP)/device/softwinner/polaris_p1/hardware/include

# 1. realtek wifi configuration
BOARD_WIFI_VENDOR := realtek

ifeq ($(BOARD_WIFI_VENDOR), rda)
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := WEXT
    SW_BOARD_USR_WIFI := rda5990
    BOARD_WLAN_DEVICE := rda5990
	BOARD_WLAN_RDA_COMBO := true
	
endif
ifeq ($(BOARD_WIFI_VENDOR), realtek)
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl
    SW_BOARD_USR_WIFI := rtl8188eu
    BOARD_WLAN_DEVICE := rtl8188eu
    # SW_BOARD_USR_WIFI := rtl8723au
    # BOARD_WLAN_DEVICE := rtl8723au
endif

# 2. Bluetooth Configuration
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_RTK := true
SW_BOARD_HAVE_BLUETOOTH_NAME := rtl8723au


# Sepolicy
BOARD_SEPOLICY_DIRS += \
    device/softwinner/polaris_p1/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    device.te \
    domain.te \
    drmserver.te \
    file.te \
    file_contexts \
    surfaceflinger.te \
    system.te \
    rild.te \
    vold.te \
    wpa_supplicant.te \

