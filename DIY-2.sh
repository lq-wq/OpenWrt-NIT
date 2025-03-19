# DIY-2 此脚本功能：修改固件参数
# ============================================================================================

# 1-修改管理地址
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 2-修改内核版本
sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.12/g' ./target/linux/x86/Makefile

# 3-删除默认密码
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

# 4-修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 5-修改时间格式
sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 6-添加编译日期
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk

# 7-只显示CPU型号
sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}${hydrid}/g' package/lean/autocore/files/x86/autocore

# 添加白名单机制（保留核心组件）
KEEP_PKGS="luci-base busybox dnsmasq"

awk -v keep="$KEEP_PKGS" '
  BEGIN {split(keep, arr, " ")}
  /^CONFIG_PACKAGE/ && !/#/ {
    pkg = $1
    gsub(/\//,"\\/",pkg)
    for (i in arr) if (pkg ~ arr[i]) next  # 跳过白名单
    print pkg
  }' current.config | \
xargs -I{} sed -i "s|^.*{}\(.*\)=y|# \1 is not set|" .config
