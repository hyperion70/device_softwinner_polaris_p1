Alwinner A23 (q8h, gt90h) CyanogenMod 11 device tree
----------------------------------------------------

Hardware	: sun8i

My modules:

rda_wlan 100419		 	0 - Live 0x00000000
gslX680 160796		 	0 - Live 0x00000000 (F)
mxc622x 4025		 	0 - Live 0x00000000
rtl8150 8115 			0 - Live 0x00000000
mcs7830 4948 			0 - Live 0x00000000
qf9700 5188 			0 - Live 0x00000000
asix 12322 				0 - Live 0x00000000
rda_fm_ctrl 10953 		0 - Live 0x00000000
vfe_v4l2 217916 		0 - Live 0x00000000
gc0308 10172 			1 - Live 0x00000000
vfe_subdev 3827 		2 vfe_v4l2,gc0308, Live 0x00000000
vfe_os 3175 			2 vfe_v4l2,vfe_subdev, Live 0x00000000
cci 2954 				1 gc0308, Live 0x00000000
cam_detect 41421 		1 vfe_v4l2, Live 0x00000000
videobuf_dma_contig 3821 1 vfe_v4l2, Live 0x00000000
videobuf_core 15500 	2 vfe_v4l2,videobuf_dma_contig, Live 0x00000000
sunxi_keyboard 2785 	0 - Live 0x00000000
sw_device 12264 		0 - Live 0x00000000
leds_sunxi 1279 		0 - Live 0x00000000
mali 174801 			15 - Live 0x00000000 (O)
lcd 7374 				0 - Live 0x00000000
disp 1045669 			8 mali,lcd, Live 0x00000000
nand 256441 			8 - Live 0x00000000 (O)

