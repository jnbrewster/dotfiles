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

f0=$'\e[1;30m'
f1=$'\e[1;37m'

# INFO

USER="Joel"
HOST="BirthdayBook-Pro"
DISTRO="OS X 10.10.5"
KERNEL="Darwin"
KERNEL="Darwin"
SHELL="fish"
TERMINAL="screen-256color"
CPU="Intel Core i5-4278U CPU @ 2.60GHz"
MEMORY="8 GB"

cat << EOF

${c00}██${c08}██ ${c07}User	: ${USER}
${c01}██${c09}██ ${c07}Hostname 	: ${HOST}
${c02}██${c10}██ ${c07}Distro   	: ${DISTRO}
${c03}██${c11}██ ${c07}Kernal    	: ${KERNEL}
${c04}██${c12}██ ${c07}Terminal 	: ${TERMINAL}
${c05}██${c13}██ ${c07}CPU	: ${CPU}
${c06}██${c14}██ ${c07}Shell    	: ${SHELL}
${c07}██${c15}██ ${c07}Memory     : ${MEMORY}

EOF
