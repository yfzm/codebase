#!/bin/bash

# Supported NIC model:
# - e1000
# - e1000e
# - rtl8139
# - virtio-net-pci
# - vmxnet3
DEFAULT_NET_MODEL="vmxnet3"

# Supported block model:
# - none
# - ahci
# - ???
DEFAULT_BLOCK_MODEL="none"

NET_MODEL="$DEFAULT_NET_MODEL"
BRIDGE="off"
BLOCK_MODEL="$DEFAULT_BLOCK_MODEL"
CPU="16"
MEM="8"

POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -n|--net-model)
      NET_MODEL="$2"
      shift
      shift
      ;;
    -B|--brige_support)
      BRIDGE="on"
      shift
      ;;
    -b|--block-model)
      BLOCK_MODEL="$2"
      shift
      shift
      ;;
    -c|--cpu)
      CPU="$2"
      shift
      shift
      ;;
    -m|--memory)
      MEM="$2"
      shift
      shift
      ;;
    *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift
      ;;
  esac
done

set -- "${POSITIONAL[@]}" # restore positional parameters

echo "NET_MODEL       = ${NET_MODEL} (bridge $BRIDGE)"
echo "BLOCK_MODEL     = ${BLOCK_MODEL}"

if [[ -n $1 ]]; then
    echo "Last line of file specified as non-opt/last argument:"
    tail -1 "$1"
fi

if [[ $BRIDGE =~ on ]]; then
    net_args="-netdev tap,id=mynet0,ifname=tap0,script=no,downscript=no -device ${NET_MODEL},netdev=mynet0,mac=52:55:00:d1:55:01"
else
    net_args="-net user,hostfwd=tcp::10022-:22,hostfwd=::15001-:5001 -net nic,model=${NET_MODEL}"
fi

case ${BLOCK_MODEL} in
    none)
        ;;
    ahci)
        block_args="-drive id=disk,file=test_fs.img,if=none -device ahci,id=ahci -device ide-hd,drive=disk,bus=ahci.0"
        ;;
    *)
        echo "Unsupported block model ${BLOCK_MODEL}. exit..."
        exit 1
        ;;
esac


sudo qemu-system-x86_64 \
    --enable-kvm \
    -cpu host \
    -smp $CPU \
    -m ${MEM}G \
    -hda test-vm.img \
    -gdb tcp::1236 \
    -nographic \
    ${net_args} \
    ${block_args}

