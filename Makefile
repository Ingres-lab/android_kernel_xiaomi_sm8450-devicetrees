# SPDX-License-Identifier: GPL-2.0
vendor := $(src)

ifeq ($(CONFIG_ARCH_CANOE),y)
DTC_INCLUDE += \
	$(srctree)/../vendor/qcom/sm8850-modules/qcom/opensource/audio-kernel/include \
	$(srctree)/../vendor/qcom/sm8850-modules/qcom/opensource/camera-kernel \
	$(srctree)/../vendor/qcom/sm8850-modules/qcom/opensource/synx-kernel
endif

# ingres (waipio): the 6.6 audio/camera techpacks, see qcom/ingres-sm8450-full-overlay.dtso
ifeq ($(CONFIG_ARCH_WAIPIO),y)
DTC_INCLUDE += \
	$(srctree)/../vendor/xiaomi/sm8450-modules/qcom/opensource/audio-kernel/waipio/include \
	$(srctree)/../vendor/xiaomi/sm8450-modules/qcom/opensource/camera-kernel/waipio
endif

ifneq "$(wildcard $(vendor)/qcom)" ""
	subdir-y += qcom
endif

# Silence all DTC warnings by default
DTC_FLAGS += -q
