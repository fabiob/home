#!/bin/bash
charset=`file -I "$1" | sed "s/^.*charset=//"`
case $charset in
	iso-8859* | utf-8 ) iconv -c -f $charset -t MacRoman "$1" ;;
        * ) cat "$1" ;;
esac
