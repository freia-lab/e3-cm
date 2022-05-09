# This should be a test or example startup script

require cm
require recsync
require iocstats

epicsEnvSet("IOCNAME", "ioc17-cm")

iocshLoad("$(cm_DIR)/cm.iocsh", "PLC_IP=192.168.1.11, TOP=/opt/epics/autosave, IOCNAME=$(IOCNAME)")

# iocStats database
dbLoadRecords("$(iocstats_DB)/iocAdminSoft-ess.db","IOC=$(IOCNAME)")

# Start recsync client
#iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")
