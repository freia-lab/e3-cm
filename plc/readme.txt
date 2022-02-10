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
TestEssProtoFreia_20201117 - KG, Removed a few networks in FC3 (ACQ_CABTF) - network accessing CABTF4, and some unused data blocks. Deleted DB20, DB5 and 
			     DBxx (some LC cable). Last backup before changing the hardware configuration (deleting CABFT4 that is moved to uGersemi).
TestEssProtoFreia_20201118 - KG, Updated hardware configuration. Added manging CV5202 valve.
TestEssProtoFreia_20201120 - KG, Fixed the status of the CERNOX channels (FC3) (error in the Epics Database). I will not include this version in the repository
			     becasue I will remove this change when I fix the database.
			     Added updatin the CV03:sAutoRdV in step 6 of LHe cooling state (filling 2K tank).
TestEssProtoFreia_20201123 - KG, Changed the CYC_INT5 (OB35) and S8_Parameters (DB208). The PID settings for CV01 and CV03 PIDs are taken now from the 
			     S8_parameters data block. Created a new Watch table "CV01 CV03 PIDs" for easy change of the PID parameters.
TestEssProtoFreia_20201217 - KG, Changed S8_Parameters (DB208) - new values for the CV03 PID controller. Deleted the temporary changes introduced in 
			     TestEssProtoFreia_20201120.
TestEssProtoFreia_20210118 - KG, CHanged the scaling of LT01 and LT02 from 74 to 68 cm.
TestEssProtoFreia_20210127 - KG, Changed CYC_INT2 and added S4_Parameters (DB204) block to have possibility to change the PID parameters for CV60. Added CV60 PID
			     parameters to the old watch table and renamed it to "CV01 CV03 CV60 PIDs"
TestEssProtoFreia_20210209 - KG, Moved parameters S7_LowT and S7_HighT from memory block to DB207 (S7_Parameters). It turned out that when the parameters where 
			     in the memory they have not been preserved when restarting the PLC.
TestEssProtoFreia_20210224 - KG, Added initialization of some data during the PLC start-up (transition STOP -> RUN). Made some relevant data retained (Epics_to_PLC, 
			     Sequence parameters, PID settings). Tested stoping and starting the PLC many times - all data I could see in the OPI where preserved.
TestEssProtoFreia_20210225 - KG, Prepared all data block needed for PID parameters GAIN, TI, TD, TM_LAG).
TestEssProtoFreia_20210226 - KG, Implemented setting the PID parameters for all PIDs. Added possibility to control TIC77 from Epics.
TestEssProtoFreia_20210228 - KG, Added data that should be preserved during the IOC restart and PLC RUN->STOP->RUN transitions to the Sx_Parameters data blocks. 
			     In this version of the program these added variables are not used yet. parameters (
TestEssProtoFreia_20210301 - KG, Yet another intermediate version - this time all parameters set from Epics are set in Sx_Parameters data blocks and all read-back
			     values in the PLC_to_Epics buffer are taken from Sx_Parameters blocks. The old locations for the parameters are still used in the 
			     program (they are set from Epics and used in other places in the program. They will be replaces by data from Sx_Parameters blocks
			     in the next version and the old locations of the parameters (memory block) will be removed.
TestEssProtoFreia_20210302 - KG, The first version that survives the IOC restart from telnet session and the PLC transition RUN-STOP-RUN without loosing the
			     settings. The unused variables are still left in cmd-from-epics function block but they are not used anymore and I will
			     remove them later.
TestEssProtoFreia_20210330 - KG, Changed control of CV07 - it is kept closed all the time. Added a new PV CM-CM:PT02-direct:sRdV - PT02 read by the PLC's ADC.
TestEssProtoFreia_20210506 - KG, Changed control of CV01 in S8 when quiting the sequence. Instead of letting the LIC01 controlling the CV01 I added a new parameter
			     S8_P_CV01_Step7 that is the setting of CV01 after exiting step 12 of SQ9 on HNOSS until the end of S8.
TestEssProtoFreia_20210527 - KG, Changed control of CV61 in S4: Set it to the value in defined in S4_Parameters data block. (25 closed e.i. open 75% because it's
			     a normally open (NO) type of valve.
TestEssProtoFreia_20210624 - KG, Added control of CV02 in S7 step 7: Set it to the value in defined in S8_Parameters data block and wait until VBox:TT02 drops below
			     threshold defined in S8_Parameters DB before proceeding to 2K mode.
TestEssProtoFreia_20210830 - KG, Set CV01 to 0 in the initialization phase of "Cooling to 4 K". Change inly in grafcet Network 19.
TestEssProtoFreia_20211108 - KG, Added support for CV11 and CV21 - control valves for SHe circuit. Quite a lot of changes in many blocks.
TestEssProtoFreia_20211213 - KG, Changed the names of the variables related to CV11/CV21 to FT11/FT21 to indicate that we control the flow (the valves are controlled
			     by a PID regulator connected directly to the valve and the flow meter).
TestEssProtoFreia_20220209 - KG, Added a PID regulator for controlling the pressure PT03 (at the moment PT02-direct sensor is used) using CV04. The regulator can be
			     only turned on or off manually by the operator.
TestEssProtoFreia_20220210 - KG, Added a support for reading PT03 directly from the MKS3. Filled only value field (visuState and others will be added when we will 
			     start to use this parameter.


			    