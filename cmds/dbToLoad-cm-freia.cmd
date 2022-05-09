#############################################
## DB loading                              ##
#############################################

# Add the breakpoint tables
updateMenuConvert()

dbLoadRecords("cm-General.db", "SCAN_EVNT=$(SCAN_EV)")
dbLoadRecords("cm-keithley-general.db", "PREFIX='CM',ASYN_PORT=$(A_PORT),SCAN_EVNT=$(SCAN_EV)")
#dbLoadTemplate("cm-freia.substitutions")
dbLoadRecords("cm-freia.db")
#dbLoadRecords("cm-cernox-freia.db")
dbLoadRecords("cm-cbatf-freia.db")
dbLoadRecords("cm-keithley-freia.db","ASYN_PORT=$(A_PORT), SCAN_EVNT=$(SCAN_EV)")
