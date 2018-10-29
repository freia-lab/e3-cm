#############################################
## DB loading                              ##
#############################################

# Add the breakpoint tables
updateMenuConvert()

dbLoadRecords("cm-General.db")
dbLoadRecords("cm-keithley-general.db", "PREFIX='CM',ASYN_PORT=$(K_PORT)")
#dbLoadTemplate("cm-freia.substitutions")
dbLoadRecords("cm-freia.db")
dbLoadRecords("cm-cernox-freia.db")
dbLoadRecords("cm-keithley-freia.db","ASYN_PORT=$(K_PORT)")
