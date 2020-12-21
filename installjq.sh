#!/bin/bash

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

# Run as root or sudo root

 if [ "$USER" != "root" ]; then
   echo "User must be root"
   exit 120
 fi

#epel-release is needed for jq (json manipulation (query))
 yum -y install epel-release
 yum -y install jq
#moreutils needed for sponge, in case needed for jq redirection
 yum -y install moreutils

