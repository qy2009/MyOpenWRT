  
#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# 默认IP
sed -i 's/192.168.1.1/12.0.0.1/g' openwrt/package/base-files/files/bin/config_generate

# 添加第三方插件
git clone https://github.com/KFERMercer/luci-app-serverchan package/lean/luci-app-serverchan
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/lean/luci-app-adguardhome
# git clone https://github.com/kang-mk/luci-app-smartinfo package/lean/luci-app-smartinfo
