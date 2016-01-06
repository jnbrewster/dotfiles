#!/bin/bash
if [ `uname` = 'Darwin' ] ; then
  percent=`ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%d", $10/$5 * 100)}'`
fi
echo " $percent% "
