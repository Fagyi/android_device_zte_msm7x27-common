#
# Copyright (C) 2011 The Android Open-Source Project
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

# Target
ARCH_ARM_HAVE_TLS_REGISTER 		:= true
TARGET_ARCH            			:= arm
TARGET_ARCH_LOWMEM     			:= true
TARGET_ARCH_VARIANT    			:= armv6-vfp
TARGET_BOARD_PLATFORM  			:= msm7x27
TARGET_CPU_ABI         			:= armeabi
TARGET_CPU_ABI2        			:= armeabi-v6l
TARGET_CPU_VARIANT     			:= arm11
TARGET_NO_BOOTLOADER   			:= true
TARGET_NO_RADIOIMAGE   			:= true
COMMON_GLOBAL_CFLAGS   			+= -DTARGET_MSM7x27

TARGET_SPECIFIC_HEADER_PATH 		:= device/zte/skate/include
TARGET_BOOTLOADER_BOARD_NAME 		:= skate

# Define BOARD_HAVE_BLUETOOTH_BLUEZ before device/qcom/msm7x27/BoardConfigCommon.mk
# Bluetooth
BOARD_HAVE_BLUETOOTH 			:= true
BOARD_HAVE_BLUETOOTH_BCM 		:= true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/skate/bluetooth
BOARD_BLUEDROID_VENDOR_CONF 		:= device/zte/skate/bluetooth/libbt_vndcfg.txt

# Use the non-open-source parts, if they're present
include vendor/zte/skate/BoardConfigVendor.mk

# Recovery
BOARD_CUSTOM_GRAPHICS 				:= ../../../device/zte/skate/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING 	:= ../../device/zte/skate/recovery/recovery_keys.c
TARGET_NO_INITLOGO 			:= true
TARGET_NO_SEPARATE_RECOVERY 		:= true
TARGET_RECOVERY_PIXEL_FORMAT 		:= "RGB_565"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH 	:= \"/sys/class/leds/lcd-backlight/brightness\"
TARGET_RECOVERY_FSTAB 			:= device/zte/skate/recovery/recovery.fstab
ifneq (eng,$(TARGET_BUILD_VARIANT))
TARGET_KERNEL_CONFIG 			:= skate_jb_defconfig
else
TARGET_KERNEL_CONFIG 			:= skate_recovery_defconfig
MINIGZIP 				:= $(shell which lzma)
endif

# Kernel and target stuff
BOARD_KERNEL_BASE 			:= 0x02600000
BOARD_KERNEL_PAGESIZE 			:= 2048
BOARD_KERNEL_CMDLINE 			:= androidboot.hardware=skate console=null
TARGET_BOOTLOADER_NAME 			:= skate
TARGET_OTA_ASSERT_DEVICE 		:= skate
TARGET_KERNEL_SOURCE 			:= kernel/zte/skate

# Graphics
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET      := true
BOARD_EGL_CFG                           := device/zte/skate/prebuilt/egl.cfg
BOARD_EGL_NEEDS_LEGACY_FB               := true
BOARD_EGL_WORKAROUND_BUG_10194508       := true
BOARD_USE_MHEAP_SCREENSHOT              := true
HWUI_COMPILE_FOR_PERF                   := true
TARGET_BOARD_PLATFORM_GPU 		:= qcom-adreno200
TARGET_NO_HW_OVERLAY                    := true
TARGET_NO_HW_VSYNC 			:= true
TARGET_QCOM_DISPLAY_VARIANT             := legacy
TARGET_QCOM_HDMI_OUT 			:= false
TARGET_QCOM_LEGACY_OMX 			:= true
TARGET_DOESNT_USE_FENCE_SYNC		:= true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK 	:= true
USE_OPENGL_RENDERER                     := true
COMMON_GLOBAL_CFLAGS 			+= -DANCIENT_GL
COMMON_GLOBAL_CFLAGS 			+= -DREFRESH_RATE=60

# QCOM hardware
BOARD_USES_QCOM_HARDWARE                := true
BOARD_USES_QCOM_LIBS                    := true
COMMON_GLOBAL_CFLAGS                    += -DQCOM_HARDWARE

# Video
TARGET_QCOM_LEGACY_OMX                  := true
TARGET_QCOM_MEDIA_VARIANT               := legacy
TARGET_ENABLE_QC_AV_ENHANCEMENTS        := true
COMMON_GLOBAL_CFLAGS                    += -DQCOM_NO_SECURE_PLAYBACK

# Wifi
WPA_SUPPLICANT_VERSION 			:= VER_0_8_X
BOARD_WLAN_DEVICE 			:= bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER 		:= WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB 	:= lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH 		:= "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_AP 			:= "/system/etc/fw_4319.bin"
WIFI_DRIVER_FW_PATH_STA 		:= "/system/etc/fw_4319_apsta.bin"
WIFI_DRIVER_MODULE_ARG 			:= "firmware_path=/system/etc/fw_4319.bin nvram_path=/system/etc/nv_4319.txt iface_name=wlan"
WIFI_DRIVER_MODULE_NAME 		:= "dhd"
WIFI_DRIVER_LOADER_REUSE 		:= true
WIFI_BAND 				:= 802_11_ABG

# Provides
BOARD_PROVIDES_LIBRIL 			:= true
TARGET_PROVIDES_LIBAUDIO 		:= true
TARGET_PROVIDES_LIBLIGHT 		:= true

# FM Radio
#BOARD_USES_STE_FMRADIO 		:= true
#BOARD_HAVE_QCOM_FM 			:= true
#COMMON_GLOBAL_CFLAGS 			+= -DSTE_FM -DQCOM_FM_ENABLED

# Bootanimation
TARGET_BOOTANIMATION_USE_RGB565 	:= true
TARGET_BOOTANIMATION_PRELOAD 		:= true
TARGET_BOOTANIMATION_TEXTURE_CACHE 	:= true

# Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK 	:= true
BOARD_CAMERA_NO_UNWANTED_MSG 		:= true
BOARD_NEEDS_MEMORYHEAPPMEM      	:= true
TARGET_DISABLE_ARM_PIE          	:= true

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES 		:= libhealthd.msm7x27

# Force the screenshot path to CPU consumer
COMMON_GLOBAL_CFLAGS 			+= -DFORCE_SCREENSHOT_CPU_PATH

# Metadata
SKIP_SET_METADATA 			:= true
USE_SET_METADATA 			:= false

# USB
BOARD_UMS_LUNFILE 			:= "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH 	:= /sys/devices/platform/msm_hsusb/gadget/lun0/file

# SELinux
BOARD_SEPOLICY_DIRS += device/zte/skate/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts \
    genfs_contexts

## TEMPORARY HACK: skip building external/chromium_org/
PRODUCT_PREBUILT_WEBVIEWCHROMIUM 	:= yes

# Fonts
SMALLER_FONT_FOOTPRINT 			:= true

# Javascript, Browser and Webkit
ENABLE_JSC_JIT          		:= true
ENABLE_WEBGL 				:= true
WITH_JIT                		:= true
JS_ENGINE               		:= v8
HTTP                    		:= chrome
TARGET_FORCE_CPU_UPLOAD 		:= true
TARGET_WEBKIT_USE_MORE_MEMORY 		:= true

# Squisher
TARGET_SYSTEMIMAGE_USE_SQUISHER 	:= true

# Touchscreen support for FTS - SFR
# BOARD_USE_LEGACY_TOUCHSCREEN 		:= true

## OTA script extras file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE 			:= device/zte/skate/releasetools-extras.txt

# dev:    size   erasesize  name
# mtd0: 00500000 00020000 "recovery"
# mtd1: 00500000 00020000 "boot"
# mtd2: 00180000 00020000 "splash"
# mtd3: 00080000 00020000 "misc"
# mtd4: 00200000 00020000 "cache"
# mtd5: 08a00000 00020000 "system"
# mtd6: 13ba0000 00020000 "userdata"
# mtd7: 00020000 00020000 "oem"
# mtd8: 00180000 00020000 "persist"
BOARD_BOOTIMAGE_PARTITION_SIZE     	:= 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 0x00600000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   	:= 299892736
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 0x0a280000
BOARD_FLASH_BLOCK_SIZE 			:= 131072
