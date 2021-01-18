# Return the old look-up table name matching the tt sensor
# Variable tt must be set in the command line:
# tt=TTxx
/^CM/ {
    if (index($0, tt) != 0)  {
        print $3
    } 
}
 
/^PwrCpl/  {
    if (index($0, tt) != 0)  {
        print $3
    } 
}
