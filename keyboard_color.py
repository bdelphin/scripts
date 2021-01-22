import usb.core
import usb.util
import sys

color = sys.argv[1].lstrip('#')
rgb_color = tuple(int(color[i:i+2], 16) for i in (0, 2, 4))

VID = 0x20a0
PID = 0x422d

driver_active = False

__dev = usb.core.find(idVendor=VID, idProduct=PID)

if __dev.is_kernel_driver_active(0):
    driver_active = True
    __dev.detach_kernel_driver(0)

usb.util.claim_interface(__dev, 0)

print('interface claimed.')

# change color
ret = __dev.ctrl_transfer(0x21, 0x09, 0x0301, 0, (0x01, 0x13, rgb_color[1], rgb_color[0], rgb_color[2], 0xfe, 0x64, 0x00))

print("return:",ret)

# release interface
usb.util.release_interface(__dev, 0)

# re-attach driver if it was before
if driver_active:
    __dev.attach_kernel_driver(0)


