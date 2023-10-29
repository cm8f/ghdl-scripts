#!/bin/bash

if [ -z "$GHDL_INSTALL_DEST" ]; then
  if command -v cygpath &>/dev/null; then
    export GHDL_INSTALL_DEST="$(cygpath -m $HOME)/.ghdl/lib"
  else
    export GHDL_INSTALL_DEST=$HOME/.ghdl/lib
  fi
fi

export SCRIPT_DIR=$(dirname $BASH_SOURCE)

_safe () {
  echo $*
  $*
  [ $? = 0 ] || exit 1
}

_ghdl () {
  local _work=${WORK:-work}
  local _dest=$GHDL_INSTALL_DEST
  local _opts="-a --std=${STD:-1993} --work=$_work --workdir=$_dest -P$_dest --ieee=synopsys -frelaxed-rules -fexplicit"
  [ -d $_dest ] || _safe mkdir -p $_dest
  _safe ${GHDL:-ghdl} $_opts  $*
}

analyse () {
  local _files=$*
  _ghdl $_files
}

analyse_list () {
  local _work=$1
  while read _src; do
    WORK=$_work analyse $_src
  done
}

git_wrapper () {
  local _repo=$1
  local _base=$(basename $_repo)
  local _tag=$2
  local _cache=${CACHE:-$HOME/.cache/ghdl}/$_base-$_tag
  if [ ! -d $_cache/.git ]; then
    _safe mkdir -p $_cache
    _safe git clone --recursive $_repo -b $_tag $_cache --depth=1
  fi
  _safe cd $_cache
}

std_suffix () {
  case "$1" in
    1993) ;;
    2008) echo ".08" ;;
    2019) echo ".19" ;;
  esac
}
