#/bin/bash

function ocr {
  ORIG="$1"
  shift
  psm="$1"
  shift
  IMG=`mktemp -t img`
  # echo "Filter: $@"
  convert "$ORIG" $@ "$IMG"
  # imgcat $IMG
  rm $TMPDIR/solved*
  tesseract -psm $psm "$IMG" "$TMPDIR/solved" captcha_sefaz 2> /dev/null
  res="`cat $TMPDIR/solved*`"
  echo "<td><img src='$IMG'><br>$res</td>" >> $HTML
  # echo "OCR results: $res"
  # echo
}

HTML=`mktemp -t html`
echo "<html><head><style>td { text-align: center; vertical-align: top; font-family: 'Consolas', monospace; }</style></head><body><table border='1'>" > $HTML

while [ ! -z "$1" ]; do
  ORIG="$1"
  shift

  IMG=`mktemp -t img`
  cp "$ORIG" $IMG
  
  convert "$IMG" -shave 0x5 "$IMG"

  echo "<tr>" >> $HTML
  echo "<td><img src='$ORIG'></td>" >> $HTML
  
  # ocr "$IMG" 7 -shave 0x0
  # ocr "$IMG" 7 -statistic Maximum 3x3
  # ocr "$IMG" 7 -negate -adaptive-blur 2x0.6 -negate
  # ocr "$ORIG" 7 -statistic Maximum 3x3 -negate -adaptive-blur 2x0.6 -negate

  # ocr "$ORIG" 7 -shave 0x5 -negate -blur 0x2 -contrast-stretch 60x0% -unsharp 0x5 -negate
  
  # ocr "$ORIG" 3 -crop 170x30+10+10 +repage -colorspace Gray                      -noise 2 -gaussian-blur 9.0      -level 0,30%,0,1 -paint 1 -depth 1 -quality 100
  # ocr "$ORIG" 3 -crop 177x33+5+10  +repage -colorspace Gray -virtual-pixel white -noise 2 -gaussian-blur 9.0x1.25 -level 0,29%,0,1 -paint 1 -depth 1 -quality 100
  ocr "$ORIG" 3 -crop 177x33+5+10 -resize 150% +repage
  # ocr "$IMG" 3 -colorspace Gray -virtual-pixel white -morphology Close Square:2 -morphology Close Diamond:2
  # ocr "$IMG" 3 -virtual-pixel white -morphology Close Diamond:3
  # ocr "$IMG" 3 -virtual-pixel white -morphology Dilate Disk:3 # -threshold 60%
  ocr "$IMG" 3 -virtual-pixel white -morphology Dilate Disk:3 
  ocr "$IMG" 3 -virtual-pixel white -morphology Erode:3 Disk:1
  # ocr "$IMG" 3 -threshold 60%

  echo "</tr>" >> $HTML

  # INDO BEM TAMBÉM
  # ocr -shave 0x3
  # ocr -statistic Maximum 3x3
  # ocr -negate -adaptive-blur 2x0.6 -negate


  # MUITO BEM!
  # ocr -shave 0x3 -statistic Maximum 3x3 -negate -adaptive-blur 2x0.6 -negate
  # ocr -negate -blur 0x2 -contrast-stretch 60x0% -unsharp 0x5 -negate
done

echo "</table></body></html>" >> $HTML

mv $HTML $HTML.html
open $HTML.html
