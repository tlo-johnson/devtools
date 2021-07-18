#! /bin/env bash

while getopts "eo" OPTION; do
  case $OPTION in
    e)
      echo "scanning even images"
      scanimage --format=png --progress --resolution 300 --mode Color --source ADF -d 'airscan:w0:EPSON WF-2750 Series' --batch-double --batch-print --batch --batch-start=1
      exit 0
      ;;

    o)
      echo "scanning odd images"
      scanimage --format=png --progress --resolution 300 --mode Color --source ADF -d 'airscan:w0:EPSON WF-2750 Series' --batch-double --batch-print --batch --batch-start=2
      exit 0
      ;;
  esac
done

if [ $# -lt 1 ]; then
  echo 'usage: scanning-in-progress.sh <output.pdf>'
  exit 1
fi

output="$1"

odd=( $( ls out*.png | sort -V | sed -n 'p;n' ) )
even=( $( ls out*.png | sort -V | sed -n 'n;p' | sort -rV ) )

for index in ${!odd[@]}; do
  pngs+="${odd[index]} "
  pngs+="${even[index]} "
done

img2pdf -o "$output" $pngs
