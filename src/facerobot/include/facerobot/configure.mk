#define Makefile variable in multi-platform

HOST_TYPE	:=$(shell uname)
#if you do not define CC_TYPE, I'll choose it automatically.
ifeq "$(CC_TYPE)"	""
ifeq "$(HOST_TYPE)" "SunOS"
	CC_TYPE	:=	forte
else
	CC_TYPE	:=	gcc
endif
endif

#define some utilites
SHELL	=/bin/sh
RM		=/bin/rm -f
CP		=/bin/cp

ifeq "$(CC_TYPE)" "forte"
	CCC		:=/opt/SUNWspro/bin/CC
	CC		:=/opt/SUNWspro/bin/cc
	CCADMIN	:=/opt/SUNWspro/bin/CCadmin
	AR  	:=$(CCC) -xar -o
else
#ifeq "$(HOST_TYPE)" "AIX"
#		CCC 	= /usr/vacpp/bin/xlC_r
#		cc 	= $(CCC)
#		AR	= /usr/bin/ar -r
#else
	CCC	=/usr/bin/g++
	CC	=/usr/bin/gcc
	AR	=/usr/bin/ar -r
#endif
endif

ifeq "$(CC_TYPE)" "forte"
	RELEASE_FLAGS	= -fast -s -xO5 -DNDEBUG -s
	DEBUG_FLAGS		= -g -D_DEBUG
	PIC_FLAG 		= -KPIC
else
#ifeq "$(HOST_TYPE)" "AIX"
#		RELEASE_FLAGS   = -qrtti=all -O3 -DNDEBUG -D_GNU_SOURCE -s
#        	DEBUG_FLAGS     = -qrtti=all -g -D_DEBUG -D_GNU_SOURCE 
#        	PIC_FLAG                = -qpic
#else
	RELEASE_FLAGS	= -O3 -DNDEBUG -D_GNU_SOURCE -s
	DEBUG_FLAGS 	= -g -D_DEBUG -D_GNU_SOURCE
	PIC_FLAG 		= -fPIC
#endif
endif

#DEBUT_OUTPUT	= xDebug
#RELEASE_OUTPUT	= xRelease

DEBUT_OUTPUT   = xebug
RELEASE_OUTPUT = xelease

OUTPUT = $(DEBUT_OUTPUT)
FLAGS  = $(DEBUG_FLAGS)
ifdef release
	OUTPUT = $(RELEASE_OUTPUT)
	FLAGS  = $(RELEASE_FLAGS)
endif

ifeq "$(CC_TYPE)" "forte"
	CXXFLAGS	= $(FLAGS) -w -mt -misalign -xtarget=ultra -xarch=v8 -DACE_HAS_EXCEPTIONS -DACE_HAS_POSIX_SEM -DACE_HAS_POSIX_SEM_TIMEOUT
	CFLAGS 		= $(FLAGS) -w -xCC -mt -misalign -xtarget=ultra -xarch=v8
	LIBS 		= -lpthread -lposix4 -lm -lthread -ldl -lnsl -lsocket -lCrun -lCstd
else
#ifeq "$(HOST_TYPE)" "AIX"
#		CXXFLAGS        = $(FLAGS) -D_SIZE_T_DEFINED -D_TIME_T_DEFINED -w -m -qthreaded 
#        	CFLAGS          =  $(FLAGS) -w -pthread -pipe
#        	LIBS            = -lpthread -ldl
#else
	CXXFLAGS 	= $(FLAGS) -w -pthread -pipe
	CFLAGS 		= $(FLAGS) -w -pthread -pipe
	LIBS		= -lpthread -ldl
#endif
endif

SCRIPTS-DIR	:= $(BASEDIR)/scripts
BASEDIR-BIN := $(BASEDIR)/../bin
BASEDIR-LIB := $(BASEDIR)/../lib

MODULE_DIR	  = $(CURDIR)
MODULE_NAME	  = $(notdir $(MODULE_DIR))
MODULE_OUTPUT = $(MODULE_DIR)/$(OUTPUT)
		
MODULE_SO		= $(MODULE_NAME).so
MODULE_EXEC		= $(MODULE_NAME)
MODULE_LIB		= $(MODULE_NAME).a
MODULE_TARGET	= $(MODULE_LIB)


LOCAL_FLAG		=
LOCAL_LIBS		=
