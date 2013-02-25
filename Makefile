###############################################################################
# $Id: Makefile,v 1.1 2012-08-25 15:35:26-07 dmfrank - $
# Derek Frank (dmfrank@greenghoti.com)
#
# NAME
#   Makefile
#
# DESCRIPTION
#   A common Makefile
#
###############################################################################

MKFILE          = Makefile
WHOAMI         ?= $(shell whoami)
PWD             = $(shell pwd)
CWD             = $(shell basename ${PWD})
#
# Define the "ci" command with respect to the current user.
# dmfrank, derekmfrank, dmf, ghoti, fain are all aliases.
#
CICMD           = ci
ifeq (${WHOAMI},dmf)
CICMD           = cil
endif

#
# Define checksource
#
CHK80           = checksource -l 80

#
# Variables
#
TXT             = README
FILES           =
CHKSRC          = ${MKFILE}
CHKFILES        =
ALLFILES        = ${MKFILE} ${TXT}

#
# make all
#
all : clean sync

#
# Run checksource on the files
#
check : ${CHKSRC}
	- ${CHK80} ${CHKSRC}

#
# Check files into an RCS subdirectory
#
ci :
ifeq (${WHOAMI},dmf)
	${CICMD} + ${ALLFILES}
endif

#
# Initialize git repository
#
gitinit :
	touch README
	git init
	git add README Makefile
	git commit -m "First commit"
	git remote add origin git@github.com:dmfrank/${CWD}.git
	git push -u origin master

#
# Sync local and remote repositories
#
sync : ci
	git add --all
	git commit -a
	git status
	git push
#git pull

#
# Clean and spotless remove genereated files
#
clean :
	- rm blah

spotless : clean
