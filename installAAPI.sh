#! /bin/bash


#Copyright 2019 BMC Software, Inc.
#
# Permission to use, copy, modify, and/or distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright notice 
# and this permission and disclaimer notices appear in all copies.
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH 
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND 
# FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, 
# OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, 
# DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS 
# ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# BMC SOFTWARE DOES NOT PROVIDE SUPPORT OR DOCUMENTATION FOR THIS SOFTWARE.
# USAGE OF ALL OR PART OF THIS SOFTWARE IMPLIES ACCEPTANCE OF THESE TERMS.

#Change log
# 2018 10 03    dcompane, BMC   Initial release
# 2019 01 17	dcompane, BMC	Adding license to enable distribution

# Run as root or sudo
 if [ "$USER" != "root" ]; then
   echo "User must be root. Running as ${USER}."
   exit 120
 fi


#**********************************************************
# THIS MUST BE SET FOR THE SPECIFIC INSTALLATION
#    EDIT THE FILE TO REFLECT THE ENVIRONMENT
#    USE A JSON FORMATTER TO ENSURE GOOD STYLE
#    DO NOT REPEAT TAGS ACROSS SETS.
scriptdir=`dirname $0`
CONFIG_FILE="${scriptdir}/tktvars.json"


# THIS MUST BE SET FOR THE SPECIFIC INSTALLATION
ctmaapi=`jq -r .ctmvars.ctmaapi $CONFIG_FILE`
AAPIurl="$ctmaapi/ctm-cli.tgz"

#install the AAPI
#  This will throw an error ( ctm: command not found) if ctm is not installed
which ctm >/dev/null
rc=$?
if [ $rc -ne 0 ]; then
  yum -y install wget
  yum -y install gcc-c++ make
  curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -
  yum -y install nodejs
  npm -g install npm@latest
  wget --no-check-certificate -P /tmp $AAPIurl
  npm -g install /tmp/ctm-cli.tgz
  ctm
fi

