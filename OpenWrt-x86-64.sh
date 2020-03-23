  
#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# 定制默认IP
sed -i 's/10.0.0.1/10.0.0.254/g' package/base-files/files/bin/config_generate

# 添加第三方软件包
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/jefferymvp/luci-app-koolproxyR

#创建自定义配置文件 - OpenWrt-x86-64

rm -f ./.config*
touch ./.config

#
# ========================固件定制部分========================
# 

# 
# 如果不对本区块做出任何编辑, 则生成默认配置固件. 
# 

# 以下为定制化固件选项和说明:
#

#
# 有些插件/选项是默认开启的, 如果想要关闭, 请参照以下示例进行编写:
# 
#          =========================================
#         |  # 取消编译VMware镜像:                   |
#         |  cat >> .config <<EOF                   |
#         |  # CONFIG_VMDK_IMAGES is not set        |
#         |  EOF                                    |
#          =========================================
#

# 
# 以下是一些提前准备好的一些插件选项.
# 直接取消注释相应代码块即可应用. 不要取消注释代码块上的汉字说明.
# 如果不需要代码块里的某一项配置, 只需要删除相应行.
#
# 如果需要其他插件, 请按照示例自行添加.
# 注意, 只需添加依赖链顶端的包. 如果你需要插件 A, 同时 A 依赖 B, 即只需要添加 A.
# 
# 无论你想要对固件进行怎样的定制, 都需要且只需要修改 EOF 回环内的内容.
# 

# 编译x64固件:
cat >> .config <<EOF
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_Generic=y
EOF

# 设置固件大小:
cat >> .config <<EOF
CONFIG_TARGET_KERNEL_PARTSIZE=30
CONFIG_TARGET_ROOTFS_PARTSIZE=200
EOF

# 固件压缩:
cat >> .config <<EOF
CONFIG_TARGET_IMAGES_GZIP=y
EOF

# 编译UEFI固件:
cat >> .config <<EOF
# CONFIG_EFI_IMAGES is not set
EOF

# 存储和网络驱动:
cat >> .config <<EOF
# 存储驱动
CONFIG_PACKAGE_kmod-ata-core=y
CONFIG_PACKAGE_kmod-ata-ahci=y
CONFIG_PACKAGE_kmod-ata-artop=y
CONFIG_PACKAGE_kmod-ata-marvell-sata=y
CONFIG_PACKAGE_kmod-ata-nvidia-sata=y
CONFIG_PACKAGE_kmod-ata-pdc202xx-old=y
CONFIG_PACKAGE_kmod-ata-piix=y
CONFIG_PACKAGE_kmod-ata-sil=y
CONFIG_PACKAGE_kmod-ata-sil24=y
CONFIG_PACKAGE_kmod-ata-via-sata=y
CONFIG_PACKAGE_kmod-scsi-core=y
# 网络驱动
# CONFIG_PACKAGE_kmod-3c59x is not set
# CONFIG_PACKAGE_kmod-8139cp is not set
# CONFIG_PACKAGE_kmod-8139too is not set
# CONFIG_PACKAGE_kmod-atl1 is not set
# CONFIG_PACKAGE_kmod-atl1c is not set
# CONFIG_PACKAGE_kmod-atl1e is not set
# CONFIG_PACKAGE_kmod-atl2 is not set
# CONFIG_PACKAGE_kmod-b44 is not set
# CONFIG_PACKAGE_kmod-be2net is not set
# CONFIG_PACKAGE_kmod-bnx2 is not set
# CONFIG_PACKAGE_kmod-dm9000 is not set
# CONFIG_PACKAGE_kmod-dummy is not set
# CONFIG_PACKAGE_kmod-e100 is not set
# CONFIG_PACKAGE_kmod-e1000 is not set
# CONFIG_PACKAGE_kmod-e1000e=y
# CONFIG_PACKAGE_kmod-et131x is not set
# CONFIG_PACKAGE_kmod-ethoc is not set
# CONFIG_PACKAGE_kmod-forcedeth is not set
# CONFIG_PACKAGE_kmod-gigaset is not set
# CONFIG_PACKAGE_kmod-hfcmulti is not set
# CONFIG_PACKAGE_kmod-hfcpci is not set
# CONFIG_PACKAGE_kmod-ifb=y
# CONFIG_PACKAGE_kmod-igb=y
# CONFIG_PACKAGE_kmod-igbvf=y
# CONFIG_PACKAGE_kmod-ixgbe=y
# CONFIG_PACKAGE_kmod-ixgbevf=y
# CONFIG_PACKAGE_kmod-libphy is not set
# CONFIG_PACKAGE_kmod-macvlan is not set
# CONFIG_PACKAGE_kmod-mdio-gpio is not set
# CONFIG_PACKAGE_kmod-mii is not set
# CONFIG_PACKAGE_kmod-natsemi is not set
# CONFIG_PACKAGE_kmod-ne2k-pci is not set
# CONFIG_PACKAGE_kmod-niu is not set
# CONFIG_PACKAGE_kmod-of-mdio is not set
# CONFIG_PACKAGE_kmod-pcnet32 is not set
# CONFIG_PACKAGE_kmod-phy-broadcom is not set
# CONFIG_PACKAGE_kmod-phy-realtek is not set
# CONFIG_PACKAGE_kmod-phylib-broadcom is not set
# CONFIG_PACKAGE_kmod-r6040 is not set
# CONFIG_PACKAGE_kmod-r8125 is not set
# CONFIG_PACKAGE_kmod-r8169 is not set
# CONFIG_PACKAGE_kmod-siit is not set
# CONFIG_PACKAGE_kmod-sis190 is not set
# CONFIG_PACKAGE_kmod-sis900 is not set
# CONFIG_PACKAGE_kmod-skge is not set
# CONFIG_PACKAGE_kmod-sky2 is not set
# CONFIG_PACKAGE_kmod-solos-pci is not set
# CONFIG_PACKAGE_kmod-spi-ks8995 is not set
# CONFIG_PACKAGE_kmod-sw# CONFIG is not set
# CONFIG_PACKAGE_kmod-switch-ip17xx is not set
# CONFIG_PACKAGE_kmod-switch-mvsw61xx is not set
# CONFIG_PACKAGE_kmod-switch-rtl8306 is not set
# CONFIG_PACKAGE_kmod-switch-rtl8366-smi is not set
# CONFIG_PACKAGE_kmod-switch-rtl8366rb is not set
# CONFIG_PACKAGE_kmod-switch-rtl8366s is not set
# CONFIG_PACKAGE_kmod-switch-rtl8367b is not set
# CONFIG_PACKAGE_kmod-tg3 is not set
# CONFIG_PACKAGE_kmod-tulip is not set
# CONFIG_PACKAGE_kmod-via-rhine is not set
# CONFIG_PACKAGE_kmod-via-velocity is not set
# CONFIG_PACKAGE_kmod-vmxnet3=y
# USB设备支持
# CONFIG_PACKAGE_kmod-usb-core is not set
# CONFIG_PACKAGE_kmod-usb-hid is not set
# CONFIG_PACKAGE_kmod-usb-net is not set
# CONFIG_PACKAGE_kmod-usb-net-asix is not set
# CONFIG_PACKAGE_kmod-usb-net-asix-ax88179 is not set
# CONFIG_PACKAGE_kmod-usb-net-cdc-eem is not set
# CONFIG_PACKAGE_kmod-usb-net-cdc-ether is not set
# CONFIG_PACKAGE_kmod-usb-net-cdc-mbim is not set
# CONFIG_PACKAGE_kmod-usb-net-cdc-ncm is not set
# CONFIG_PACKAGE_kmod-usb-net-cdc-subset is not set
# CONFIG_PACKAGE_kmod-usb-net-dm9601-ether is not set
# CONFIG_PACKAGE_kmod-usb-net-hso is not set
# CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm is not set
# CONFIG_PACKAGE_kmod-usb-net-ipheth is not set
# CONFIG_PACKAGE_kmod-usb-net-kalmia is not set
# CONFIG_PACKAGE_kmod-usb-net-kaweth is not set
# CONFIG_PACKAGE_kmod-usb-net-mcs7830 is not set
# CONFIG_PACKAGE_kmod-usb-net-pegasus is not set
# CONFIG_PACKAGE_kmod-usb-net-pl is not set
# CONFIG_PACKAGE_kmod-usb-net-qmi-wwan is not set
# CONFIG_PACKAGE_kmod-usb-net-rndis is not set
# CONFIG_PACKAGE_kmod-usb-net-rtl8150 is not set
# CONFIG_PACKAGE_kmod-usb-net-rtl8152 is not set
# CONFIG_PACKAGE_kmod-usb-net-sierrawireless is not set
# CONFIG_PACKAGE_kmod-usb-net-smsc95xx is not set
# CONFIG_PACKAGE_kmod-usb-net-sr9700 is not set
# CONFIG_PACKAGE_kmod-usb-wdm is not set
EOF

# 第三方插件选择:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-serverchan=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_open-vm-tools=y
CONFIG_PACKAGE_luci-app-koolproxyR=y
CONFIG_PACKAGE_luci-app-control-weburl=y

EOF

# 常用LuCI插件选择:
cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun is not set
# CONFIG_PACKAGE_luci-app-transmission is not set
# CONFIG_PACKAGE_luci-app-qbittorrent is not set
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
# CONFIG_PACKAGE_luci-app-v2ray-server is not set
# CONFIG_PACKAGE_luci-app-pptp-server is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
# CONFIG_PACKAGE_luci-app-softethervpn= is not set
# CONFIG_PACKAGE_luci-app-haproxy-tcp is not set
CONFIG_PACKAGE_luci-app-webadmin=y
# CONFIG_PACKAGE_luci-app-frpc is not set
CONFIG_PACKAGE_luci-app-wrtbwmon=y
# CONFIG_PACKAGE_luci-app-hd-idle is not set
# CONFIG_PACKAGE_luci-app-ddns is not set
# CONFIG_PACKAGE_luci-app-samba is not set
# CONFIG_PACKAGE_samba36-server is not set
# CONFIG_PACKAGE_autosamba is not set
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
EOF

# LuCI主题:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-opentomcat=y
CONFIG_PACKAGE_luci-theme-opentomato=y
CONFIG_PACKAGE_luci-theme-argon-mod=y
EOF

# 常用软件包:
cat >> .config <<EOF
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_nano=y
# CONFIG_PACKAGE_screen=y
# CONFIG_PACKAGE_tree=y
# CONFIG_PACKAGE_vim-fuller=y
CONFIG_PACKAGE_wget=y
EOF

# 取消编译VMware镜像以及镜像填充 (不要删除被缩进的注释符号):
cat >> .config <<EOF
CONFIG_TARGET_IMAGES_PAD is not set
CONFIG_VMDK_IMAGES is not set
EOF

# 
# ========================固件定制部分结束========================
# 


sed -i 's/^[ \t]*//g' ./.config

# 配置文件创建完成
