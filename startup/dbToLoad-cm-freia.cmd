#############################################
## DB loading                              ##
#############################################

# Add the breakpoint tables
updateMenuConvert()

dbLoadRecords("cm-General.db")
#dbLoadTemplate("cm-freia.substitutions")
dbLoadRecords("cm-freia.db")
dbLoadRecords("cm-cernox-freia.db")
dbLoadRecords("cm-keithley.db", "PREFIX='CM'")
