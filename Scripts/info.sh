#!/usr/bin/env bash

# COLORS

c00=$'\e[0;30m'
c01=$'\e[0;31m'
c02=$'\e[0;32m'
c03=$'\e[0;33m'
c04=$'\e[0;34m'
c05=$'\e[0;35m'
c06=$'\e[0;36m'
c07=$'\e[0;37m'
c08=$'\e[1;30m'
c09=$'\e[1;31m'
c10=$'\e[1;32m'
c11=$'\e[1;33m'
c12=$'\e[1;34m'
c13=$'\e[1;35m'
c14=$'\e[1;36m'
c15=$'\e[1;37m'

f0=$'\e[1;37m'
f1=$'\e[1;30m'

# INFO

USER="joel"
HOST="BirthdayBookPro"
OS="64bit Mac OS X 10.11.1 15B42"
KERNEL="x86_64 Darwin 15.0.0"
DE="Aqua"
WM="Quartz Compositor"
FONT="FiraMonoOT 14"
LOVE="What is love?"

cat << EOF

${c00}██${c08}██ ${c00}${USER}
${c01}██${c09}██ ${c00}${HOST}
${c02}██${c10}██ ${c00}${OS}
${c03}██${c11}██ ${c00}${KERNEL}
${c04}██${c12}██ ${c00}${DE}
${c05}██${c13}██ ${c00}${WM}
${c06}██${c14}██ ${c00}${FONT}
${c07}██${c15}██ ${c00}${LOVE}

EOF
