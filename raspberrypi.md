# Raspberry Pi

## Flashing with OS X

Insert SD card. Locate which disk it is (about this mac -> System report -> find your sd card's storage device)

Unmount

    sudo diskutil unmount /dev/disk3s1
  
etc.

Write:

    sudo dd bs=1m if=THEIMAGEYOUWANTTOUSE.img of=/dev/rdisk3
