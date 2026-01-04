# Foundations of Linux Debugging, Disassembling, and Reversing
- 너구리 순진한 맛의 연습 공간
- https://www.yes24.com/product/goods/126215894 : x86_64
- https://www.yes24.com/product/goods/126215892 : aarch64

## 학습 환경

### HOST
- 아래 명령을 이용해 QEMU를 설치한다.
```shell
apt install \
  qemu-system-arm \
  u-boot-qemu
```

### QEMU

#### 데비안 이미지 다운로드
- aarch64

```shell
mkdir -p .qemu
wget -O .qemu/debian-13-nocloud-arm64.qcow2 \
  https://cloud.debian.org/images/cloud/trixie/latest/debian-13-nocloud-arm64.qcow2
qemu-img resize .qemu/debian-13-nocloud-arm64.qcow2 +29G
```

- riscv64
```shell
mkdir -p .qemu
wget -O .qemu/debian-13-nocloud-riscv64.qcow2 \
  https://cloud.debian.org/images/cloud/trixie/latest/debian-13-nocloud-riscv64.qcow2
qemu-img resize .qemu/debian-13-nocloud-riscv64.qcow2 +29G
```

#### 프로그램 설치
- QEMU를 실행하고 ***root*** 계정으로 로그인 한다.
- cfdisk 와 e2fsprogs를 설치해 파티션을 확장한다.
```shell
apt update
apt dist-upgrade -y

apt install -y \
    e2fsprogs \
    fdisk

cfdisk /dev/vda
resize2fs /dev/vda1
```

- 아래 명령을 이용해 QEMU 상에서 개발 환경을 구성한다.
```shell
apt install -y \
    build-essential \
    clang \
    gdb \
    gdbserver \
    libunwind-dev \
    linux-headers-$(uname -r) \
    linux-image-$(uname -r)-dbg \
    lld \
    llvm \
    openssh-server \
    strace \
    uftrace \
    vim \
    xxd \
    wget
apt clean

mkdir -p /mnt/iHDD00

FSTAB=$(
    cat <<EOF
iHDD00 /mnt/iHDD00 9p virtio,version=9p2000.L 0 0
/mnt/iHDD00 /home/debian/iHDD00 none bind,defaults,nofail 0 0
EOF
)
echo "${FSTAB}" >>/etc/fstab

username=debian
password=debian
adduser --comment "" --disabled-password ${username}
echo "${username}:${password}" | chpasswd
adduser debian sudo

GDBINIT=$(
    cat <<EOF
set auto-load local-gdbinit on
add-auto-load-safe-path ./
EOF
)
echo "${GDBINIT}" >/home/${username}/.gdbinit

chown ${username}:${username} -R /home/${username}

history -c && shutdown -h now
```

### Enjoy
* ID: debian / PW: debian
