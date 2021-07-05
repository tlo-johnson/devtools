#! /bin/env bash

# odd pages
# scanimage --format=png --progress --resolution 300 --mode Color --source ADF -d 'airscan:w0:EPSON WF-2750 Series' --batch-double --batch-print --batch --batch-start=1

# even pages
# scanimage --format=png --progress --resolution 300 --mode Color --source ADF -d 'airscan:w0:EPSON WF-2750 Series' --batch-double --batch-print --batch --batch-start=2

odd=( $( ls out*.png | sort -V | sed -n 'p;n' ) )
even=( $( ls out*.png | sort -V | sed -n 'n;p' | sort -rV ) )

for index in ${!odd[@]}; do
  pngs+="${odd[index]} "
  pngs+="${even[index]} "
done

# img2pdf -o 'TD Insurance Meloche Monnex - Home Insurance Renewal - June 30, 2021.pdf' $pngs
