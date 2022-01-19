package net.mwav.common.module;

public class MwavFactory {
	
	public ValidationLib validationLib;
	
	public MwavFactory() {
		validationLib = ValidationLib.getInstance();
	}

}
