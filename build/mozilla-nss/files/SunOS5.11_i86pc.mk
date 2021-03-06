NS_USE_GCC = 1
USE_SYSTEM_ZLIB = 1
NSS_USE_SYSTEM_SQLITE = 1
INCLUDES += -I/usr/include/mps
ifeq ($(USE_64),1)
OS_LIBS += -L/usr/lib/mps/secv1/amd64 -R/usr/lib/mps/secv1/amd64 -lz -lsqlite3
else
OS_LIBS += -L/usr/lib/mps/secv1 -R/usr/lib/mps/secv1 -lz -lsqlite3
endif

#
# ***** BEGIN LICENSE BLOCK *****
# Version: MPL 1.1/GPL 2.0/LGPL 2.1
#
# The contents of this file are subject to the Mozilla Public License Version
# 1.1 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
# The Original Code is the Netscape security libraries.
#
# The Initial Developer of the Original Code is
# Netscape Communications Corporation.
# Portions created by the Initial Developer are Copyright (C) 1994-2000
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#
# Alternatively, the contents of this file may be used under the terms of
# either the GNU General Public License Version 2 or later (the "GPL"), or
# the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
# in which case the provisions of the GPL or the LGPL are applicable instead
# of those above. If you wish to allow use of your version of this file only
# under the terms of either the GPL or the LGPL, and not to allow others to
# use your version of this file under the terms of the MPL, indicate your
# decision by deleting the provisions above and replace them with the notice
# and other provisions required by the GPL or the LGPL. If you do not delete
# the provisions above, a recipient may use your version of this file under
# the terms of any one of the MPL, the GPL or the LGPL.
#
# ***** END LICENSE BLOCK *****

SOL_CFLAGS	= #-D_SVID_GETTOD

include $(CORE_DEPTH)/coreconf/SunOS5.mk

ifeq ($(USE_64),1)
    CPU_ARCH		= x86_64
else
    CPU_ARCH		= x86
    OS_DEFINES		+= -Di386
endif

ifeq ($(OS_RELEASE),5.11_i86pc)
	OS_DEFINES += -DSOLARIS2_11
endif

OS_LIBS += -lnsl -lsocket -ldl -lc
DSO_LDOPTS += -nostdlib
