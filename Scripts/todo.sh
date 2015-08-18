GREEN='\033[00;32m'
YELLOW='\033[00;33m'
LRED='\033[01;31m'
RED='\033[00;31m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
BLUE='\033[00;34m'

echo "${RED}"
ls -c ~/Dropbox | grep @due

echo "${BLUE}"
ls -c ~/Dropbox | grep @home

echo "${YELLOW}"
ls -c ~/Dropbox | grep @mac

echo "${GREEN}"
ls -c ~/Dropbox | grep @errands


