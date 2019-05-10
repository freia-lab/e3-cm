require autosave,5.7+
require streamdevice,2.7+

epicsEnvSet("AUTOSAVE_SYSM_PV_PREFIX","cm:")

epicsEnvSet("A_PORT"   "K_PORT")
epicsEnvSet("SCAN_EV"  "8")

addScan("30")

#############################################
## Register all support components         ##
#############################################

requireSnippet(userPreDriverConf-cm-freia.cmd, "IP_ADDR=$(PLC_IPADDR), IP_ADDR2=$(KEITH_IPADDR)")
sleep 2
requireSnippet(dbToLoad-cm-freia.cmd, "K_PORT=$(A_PORT), SCAN_EVNT=$(SCAN_EV)")
requireSnippet(cm-freia-preSaveRestore.cmd)

#############################################
## IOC initialization                      ##
#############################################

iocInit

dbpf CM-RHtr:CV550:sAuto.ONAM "PID Reg. On"
dbpf CM-RHtr:CV550:sAuto.ZNAM "PID Reg. Off"

requireSnippet(cm-freia-postSaveRestore.cmd)
requireSnippet(userPostDriverConf-cm-freia.cmd)

