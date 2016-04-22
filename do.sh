#!/usr/bin/env bash
GREEN="\\033[1;32m"
NORMAL="\\033[0;39m"
RED="\\033[1;31m"
PINK="\\033[1;35m"
BLUE="\\033[1;34m"
WHITE="\\033[0;02m"
WHITE_LIGHT="\\033[1;08m"
YELLOW="\\033[1;33m"
CYAN="\\033[1;36m"


IMAGE_NAME='rogeriopradoj/php-manual-pt-br-dependencies'

log() {
  echo -e "$BLUE > $1 $NORMAL"
}

error() {
  echo -e -n "$RED"
  echo " >>> ERROR - $1"
  echo -e -n "$NORMAL"
}

git() {
  log "git via container"
  docker run -it --rm -w=/php-manual-pt-br -v $(pwd):/php-manual-pt-br $IMAGE_NAME sh -c "git $*"
}

pear() {
  log "pear via container"
  docker run -it --rm -w="/php-manual-pt-br" -v $(pwd):/php-manual-pt-br $IMAGE_NAME sh -c "pear $*"
}

phd() {
  log "phd via container"
  docker run -it --rm -w="/php-manual-pt-br" -v $(pwd):/php-manual-pt-br $IMAGE_NAME sh -c "phd $*"
}

php() {
  log "php via container"
  docker run -it --rm -w="/php-manual-pt-br" -p 4000:4000 -v $(pwd):/php-manual-pt-br $IMAGE_NAME sh -c "php $*"
}

rsync() {
  log "rsync via container"
  docker run -it --rm -w="/php-manual-pt-br" -v $(pwd):/php-manual-pt-br $IMAGE_NAME sh -c "rsync $*"
}

svn() {
  log "svn via container"
  docker run -it --rm -w="/php-manual-pt-br" -v $(pwd):/php-manual-pt-br $IMAGE_NAME sh -c "svn $*"
}

sh() {
  log "SH"
  docker run -it --rm -w="/php-manual-pt-br" -p 4000:4000 -v $(pwd):/php-manual-pt-br $IMAGE_NAME sh
}

update() {
  log "update repos"
  docker run -it --rm -w="/php-manual-pt-br" -v $(pwd):/php-manual-pt-br $IMAGE_NAME sh -c "/scripts/0-default.sh"
}

test() {
  log "test your manual compilation via 0.0.0.0:4000 in your browser"
  docker run -it --rm -w="/php-manual-pt-br"  -p 4000:4000 -v $(pwd):/php-manual-pt-br $IMAGE_NAME sh -c "php -S 0.0.0.0:4000 -t /php-manual-pt-br/web-php"
}

help() {
  echo "-----------------------------------------------------------------------"
  echo "                      Available commands                              -"
  echo "-----------------------------------------------------------------------"
  echo -e -n "$GREEN"
  echo " _Standalone_"
  echo "=============="
  echo "   > git"
  echo "   > pear"
  echo "   > phd"
  echo "   > php"
  echo "   > rsync"
  echo "   > svn"
  echo " _Helpers_"
  echo "=============="
  echo "   > update - Sync your repos with upstream"
  echo "   > test - Test your manual compilation via 0.0.0.0:4000 in your browser"
  echo " _Extras_"
  echo "=============="
  echo "   > sh - Log you into container"
  echo "   > help - Display this help"
  echo "-----------------------------------------------------------------------"
  echo -e -n "$NORMAL"


}

$*

if [ "$#" -ne 1 ];
then
  help
  exit 1
fi