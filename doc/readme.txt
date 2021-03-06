TestEssProtoFreia_20181219 - KG, 2019-12-19 - Cleaned the code-modified to get rid of compilation warnings, removed unused code.
			     There are still a lot of unused tags.
TestEssProtoFreia_20181219-1 - KG, 2019-12-19 - More code cleaning - moved PID controller for CV02 to OB35 and created a separate
			     DB block for this controller (previously it shared the DB block with CV01 PID controller).
			     Added the status bits showing if the PID controller is active to the Epics buffer.

TestEssProtoFreia_20190204 - KG, 2019-02-04 - Added Support for a new PLC connection for sending the temperature data from the IOC
			     Modified the hardware configuration for ADC rack0 station 8 channel 6-7 - changed from +-10V to 4-20 mA (2 wire)
			     The hardware set-up module set to D position).
TestEssProtoFreia_20190208 - KG, 2019-02-08 - Changed the cycle time of OB35 (from 1 s to 100 ms). Change the PID parameters of the LT03 
			     regulation (increased the gain from 2 to 4, decreased Ti Td by a factor of 10.
			     Added FT11 and FT21 (change of the hardware configuration)
			     Added function and data blocks for the heaters controllers (so far only VB channels 1-6) in the manual mode.
			     For this it was needed to get the data from the IOC (separate connection channel on port 2001).
TestEssProtoFreia_20190214 - KG, lots of changes. Added data exchange with HNOSS. New PVs TT102 (thermocuple), TT202(thermocouple), 
			     TT103(Pt100), TT203(Pt100). Changed the scaling of LT01,LT03. Changed the system configuration to
			     accomodate new PVs.
TestEssProtoFreia_20190215 - KG, Changed scaling of FT11 & FT21 to avoid errors due to noise around 0 (negative values > 0.5 mg/s will 
			     notgive any error.
TestEssProtoFreia_20190219 - KG, Added the new CM heaters and coupler flanges heaters. Changed the LT03 max value to 74 cm.
TestEssProtoFreia_20190322 - KG, Added new I/O modules (ADC and DAC). Changed scaling factors for the thermocouples. Added status
			     bits to the IOC2PLC data block (not completed)
TestEssProtoFreia_20190325 - KG, Completed adding the status bits for the temperatures from Keithley and made use of them in 
			     the heaters controls (they are ANDed with EPICS_COM_OK and fed to TS argument (thermal switch).
TestEssProtoFreia_20190412 - KG, Almost completed automatic warm-up procedure for the existing heaters. The part missing is the control
			     of the valves on the HNOSS PLC and sending back the status to the CM PLC (FV401, CV5202).
TestEssProtoFreia_20190425 - KG, Added producing interlock signal fort the RF slow interlock. (CM_CryoOK)
TestEssProtoFreia_20190429 - KG, Some code clean-up (deleted unused symbols). Added a one minute flag for controlling the CV03 valve
			     during the cool-down sequence.
TestEssProtoFreia_20190509 - KG,Defined new fields in DB DataFromHNOSS. Added parameters for S5 (Cool-down). Added step number 
			     variable in states S4-S10
TestEssProtoFreia_20190510 - KG, Updated CV550:sSetV from CV550:cSetV. sSetV is read by HNOSS MKS2 when the PID regulator is off.
TestEssProtoFreia_20190515 - KG, Added sending data for MKS2 (CV550 set value and PID set point).
			     Fixed changing the steps in the warm-up procedure (grafcet)
			     Changed CYC_INT5 object block to keep the PID for CV02/CV03 active in steps 4 & 6 of the standby state. 
			     Changed the PID parameters for CV03.
			     Added logic for the standby state in grafcet. 
TestEssProtoFreia_20190516 - KG, Standby state: changed the logic of the transition from cooling to heating
TestEssProtoFreia_20190528 - KG, Changed limits for the stand/by temperature from constants to memory locations

TestEssProtoFreia_20190529 - KG, Modified the 1 s interrupt block OB32 - changed the local symbol to memory location in the
			     network genereting OneMinute bit.
			     Modified logic in the grafcet function block Network 21 (controlling CV03 according to the FT552 limits).
			     Added initialization of temporary variables missing for standby mode.

TestEssProtoFreia_20190617 - KG, Added state of 2K operation sequence (SQ9_state) from HNOSS to DB102.
			     Added parameter S8_P_CV01 in db100/db101 and FC33.

TestEssProtoFreia_20190619 - KG, Added S8_paprameters data block. Disabled LT01 PID in step4 (precooling) of2K operation (OB35).
			     Fixed bug: LT01 PID showed status on even if CV01 was in manual mode (OB35).
			     Added VBox:TT03 and CM:TT02 to IOC2PLC db. Added all functions in grafcet to handle the 2K operation.

TestEssProtoFreia_20190626 - KG, Enabled CV02 LT01 PID regulator on at S8 step4 (precooling).
			     TEMPORARY - bypassing "IOC2PLC"."VBox:TT03_VALID" condition (fault bit set in CBTF Cernox controller (in all
			     boxes channels 9-11 indicate errors - check it!!!!!!!!
			     Changed the threshold for proecooling 2K line (VBox:TT03) from 8 to 9K
			     
TestEssProtoFreia_20190627 - KG, I'm not sure if there are any changes since the last archive but just in case saved
			     the last version that has been succesfully tested 2K operation. Works with HNOSS version 20190627.
TestEssProtoFreia_20190905 - KG, Changed the PID parameters for CV01 controller in 2K mode (Gain: 2->15,I: 2->3s)
TestEssProtoFreia_20190918 - KG, Added instance of heater EH921 and the corresponding temperature sensor TT609.
TestEssProtoFreia_20191003 - KG, Added support for the automatic warm-up (changes only in grafcet). Works only with Cryostat_2019_10_03
			     or later. Not testet fully yet.
TestEssProtoFreia_20200818 - KG, Changed some names to be the same as in the series CM PID. No change in the functionality. Changes made in 
			     db100, db101, db313, db105, db228 and tags for the hardware. Recompiled and reloaded all blocks showed in the 
			     Download panel (stopped the CPU). See http://freia.physics.uu.se/Cntrlelog/show.jsp?dir=/2020/08&pos=2020-08-14T14:55:45
                             which names have been changed.
TestEssProtoFreia_20200819 - KG, Changed the control of the heaters for the series cryomodule. Added data buffers for LT02 (not filled with data yet).
			     Changes made in db100, db101, db313, db105 anf CSs for the heater control (instantiate and manage).
TestEssProtoFreia_20200820 - KG, Added support for reading LT02 (only the cabling to between the level measurement system and the PLC AI is missing).
			     At the moment the value from LT02 is not used in the process control. Maybe later I will make it possible to choose which
			     probe should be used in the process control.
TestEssProtoFreia_20200918 - KG, Added support for the valves (same object valve as in Gersemi).
			     Added GV72. 
TestEssProtoFreia_20201029 - KG, Added support for the RV90 (only manual control). The condition for automatic opening of the valve must be added but
			     it's unclear now what should be the condition (PT02 is not working good enough).
TestEssProtoFreia_20201030 - KG, Added support for the GV70 (only manual control).
TestEssProtoFreia_20201109 - KG, Added support for automatic mode for the RV90. Fixed a bug in the previous version (wrong parameter in the 
			     call of #FC_VALVES.
TestEssProtoFreia_20201110 - KG, Added support for automatic mode for the RV90. Fixed still another bug in managing RV90. Added end switches for RV90.
TestEssProtoFreia_20201112 - KG, Added updating the CV61:sAutoRdV from setting in manual mode in states S4-S8 (Thermal shield cooling, 
			     LHe cooling, 4K and 2 K operation, Stand-by).
			     Added updating the CV04:sAutoRdV from setting in manual mode in states S5-S8 (LHe cooling, 4K and 2 K operation, Stand-by).
TestEssProtoFreia_20201117 - KG, Removed a few networks in FC3 (ACQ_CABTF) - network accessing CABTF4, and som unused data blocks. Deleted DB20, DB5 and 
			     DBxx (some LC cable). Last backup before changing the hardware configuration (deleting CABFT4 that is moved to uGersemi).
TestEssProtoFreia_20201118 - KG, Updated hardware configuration. Added manging CV5202 valve.









