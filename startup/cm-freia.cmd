#require autosave

epicsEnvSet("AUTOSAVE_SYSM_PV_PREFIX","cm:")

#############################################
## Register all support components         ##
#############################################

requireSnippet(userPreDriverConf-cm-freia.cmd, IP_ADDR=$(PLC_IPADDR))
sleep 2
requireSnippet(dbToLoad-cm-freia.cmd)
#requireSnippet(cm-freia-preSaveRestore.cmd)

#############################################
## IOC initialization                      ##
#############################################

iocInit

#requireSnippet(cm-freia-postSaveRestore.cmd)
requireSnippet(userPostDriverConf-cm-freia.cmd)

