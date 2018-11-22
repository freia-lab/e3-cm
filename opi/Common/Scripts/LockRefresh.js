importPackage(Packages.org.csstudio.opibuilder.scriptUtil); 
importPackage(Packages.org.csstudio.platform.data); 
var pv0 = PVUtil.getDouble(pvs[0]);
var pv1 = PVUtil.getDouble(pvs[1]);
if(pv0==0 && pv1==1)
	pvs[1].setValue(0);


