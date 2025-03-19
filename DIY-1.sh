# DIY-1 此脚本功能：添加外部插件
# =======================================================================================================================

# 1-添加 ShadowSocksR Plus+ 插件
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# 2-添加 PowerOff 关机插件
git clone https://github.com/WukongMaster/luci-app-poweroff.git package/luci-app-poweroff

# 3-添加主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/WukongMaster/luci-theme-opentomcat.git package/luci-theme-opentomcat
sed -i 'src-git infinityfreedomng https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git' feeds.conf.default

# 4-添加 OpenClash 插件
sed -i '$a\src-git openclash https://github.com/vernesong/OpenClash' ./feeds.conf.default

# 5-添加 PassWall 插件
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"

# 6-添加其它插件
# git clone https://github.com/lq-wq/luci-app-quickstart.git package/luci-app-quickstart
git clone https://github.com/sirpdboy/luci-app-lucky.git package/luci-app-lucky
git clone -b main https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki
git clone https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp 
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/souwei168/luci-app-store.git package/luci-app-store
