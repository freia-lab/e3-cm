
#EXCLUDE_VERSIONS = 3.15.2
EXCLUDE_VERSIONS = 3.14

include ${EPICS_ENV_PATH}/module.Makefile

EXCLUDE_ARCHS += eldk

PROJECT = ioc_cm_freia

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
#DBDS += Db/cernox-breaktables.dbd

calibration-CM01 : ./calibrations/CM01/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM01
	./tools/ficFileConv
calibration-CM02 : ./calibrations/CM02/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM02
	./tools/ficFileConv
calibration-CM03 : ./calibrations/CM03/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM03
	./tools/ficFileConv
calibration-CM04 : ./calibrations/CM04/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM04
	./tools/ficFileConv
calibration-CM05 : ./calibrations/CM05/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM05
	./tools/ficFileConv
calibration-CM06 : ./calibrations/CM06/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM06
	./tools/ficFileConv
calibration-CM07 : ./calibrations/CM07/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM07
	./tools/ficFileConv
calibration-CM08 : ./calibrations/CM08/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM08
	./tools/ficFileConv
calibration-CM09 : ./calibrations/CM09/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM09
	./tools/ficFileConv
calibration-CM10 : ./calibrations/CM10/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM10
	./tools/ficFileConv
calibration-CM11 : ./calibrations/CM11/*.fic ./calibrations/*.fic ./tools/ficFileConv
	./tools/ficFileConv CM11
	./tools/ficFileConv

#calibration : ./calibrations/*.fic ./tools/ficFileConv
#	./tools/ficFileConv


