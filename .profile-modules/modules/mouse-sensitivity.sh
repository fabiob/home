# ajusta sensibilidade do mouse e do trackpad
if [[ $XDG_SESSION_TYPE == "x11" ]]; then
  xset m 10 4
  synclient HorizTwoFingerScroll=1 PalmDetect=1 PalmMinWidth=10 PalmMinZ=100 \
            LockedDrags=1 #VertScrollDelta=-79 HorizScrollDelta=-79
fi
