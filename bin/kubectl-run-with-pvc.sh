#!/bin/bash

IMAGE="alpine"
COMMAND="/bin/sh"
SUFFIX=$(date +%s | shasum | base64 | fold -w 10 | head -1 | tr '[:upper:]' '[:lower:]')
KARGS=""

usage_exit() {
    echo "Usage: $0 [-c command] [-i image] [-n namespace] PVC ..." 1>&2
    exit 1
}

while getopts cin:h OPT
do
    case $OPT in
        i)  IMAGE=$OPTARG
            ;;
        c)  COMMAND=$OPTARG
            ;;
        n)  KARGS="$KARGS -n $OPTARG"
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done
shift $(($OPTIND - 1))

VOL_MOUNTS=()
VOLS=()
COMMA=""

for i in $@; do
  # creates each JSON array element
  VOL_MOUNTS+=("{ \"name\": \"${i}\", \"mountPath\": \"/mnt/${i}\" },")
  VOLS+=("{ \"name\": \"${i}\", \"persistentVolumeClaim\": { \"claimName\": \"${i}\" } },")
done

# removes the trailing comma from each array
VOL_MOUNTS[-1]="${VOL_MOUNTS[-1]::-1}"
VOLS[-1]="${VOLS[-1]::-1}"

set -x
kubectl run -it --rm --restart=Never $KARGS --image=${IMAGE} pvc-mounter-${SUFFIX} --overrides "
{
  \"spec\": {
    \"containers\": [
      {
        \"image\": \"${IMAGE}\", \"args\": [\"${COMMAND}\"],
        \"stdin\": true, \"tty\": true, \"name\": \"pvc-mounter\",
        \"volumeMounts\": [
$(printf '          %s\n' "${VOL_MOUNTS[@]}")
        ]
      }
    ],
    \"volumes\": [
$(printf '      %s\n' "${VOLS[@]}")
    ]
  }
}
" -- ${COMMAND}
