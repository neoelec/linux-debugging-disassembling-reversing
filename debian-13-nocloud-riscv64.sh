#!/bin/bash

qemu-system-riscv64 -m 2G -M virt -cpu rv64 \
    -kernel /usr/lib/u-boot/qemu-riscv64_smode/uboot.elf \
    -append "root=LABEL=rootfs console=ttyS0" \
    -object rng-random,filename=/dev/urandom,id=rng \
    -device virtio-rng-device,rng=rng \
    -drive if=none,file=.qemu/$(basename $0 .sh).qcow2,id=hd0 \
    -device virtio-blk-device,drive=hd0 \
    -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::6622-:22,hostfwd=tcp::6631-:6631 \
    -virtfs local,path=${HOME}/iHDD00,mount_tag=iHDD00,security_model=passthrough,id=iHDD00 \
    -nographic
