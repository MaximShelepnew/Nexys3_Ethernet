cd C:/Xilinx/Project/Ethernet/EthernrBSB/microblaze
if { [ catch { xload xmp microblaze.xmp } result ] } {
  exit 10
}
xset intstyle default
save proj
exit 0
