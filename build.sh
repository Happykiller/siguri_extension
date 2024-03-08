#!/bin/bash
SECONDS=0
rootDir=$(pwd -P)

exec 2>&1

# import common
source "$rootDir/common.sh"

function setup() {
  cd $rootDir
  header_c "setup"
  rm -rf build/
  mkdir build/
  mkdir build/popup/
  mkdir build/background/
  mkdir build/content/
  rm -rf temp/
  mkdir temp/
}

separator_c
start_c

init
setup

generate_popup
copy_popup

#generate_background
#copy_background

#generate_content
#copy_content

copy_public

package
buildInfo

statistic_c $SECONDS
end_c