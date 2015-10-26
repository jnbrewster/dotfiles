#!/bin/bash
if [ `uname` = 'Darwin' ] ; then
  percent=`ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%d", $10/$5 * 100)}'`
fi
if   (( percent > 80  )); then color='#[fg=green]'
elif (( percent > 65  )); then color='#[fg=yellow]'
elif (( percent > 40  )); then color='#[fg=red]'
else color='#[fg=white]'
fi
echo " #[nobright fg=white]« $color$percent% #[nobright fg=white]« "
