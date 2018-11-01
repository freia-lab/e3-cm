
#EXCLUDE_VERSIONS = 3.15.2
EXCLUDE_VERSIONS = 3.14

include ${EPICS_ENV_PATH}/module.Makefile

EXCLUDE_ARCHS += eldk

#PROJECT = xxxx
#EPICSVERSION = 3.14.15.2
#EPICS_VERSION = 3.14.15.2

SOURCES = -none-

#STARTUPS = $(wildcard startup/*.cmd)

OPIS= opi

# The line below id the fix needed in environment <= 1.7.0
#vpath %.req ../../src/main/ioc

MISCS = $(AUTOMISCS)
MISCS += misc/ioc-cm-freia.req
DOC = doc
TESTS = test/server-cm.tcl

calibration : ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv


