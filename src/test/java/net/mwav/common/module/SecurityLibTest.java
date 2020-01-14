package net.mwav.common.module;

import static org.junit.Assert.assertArrayEquals;

import org.junit.Test;

public class SecurityLibTest {

	@Test
	public void keyTest() throws Exception {
		SecurityLib securityLib = SecurityLib.getInstance();

		byte[] expecteds = securityLib.generateKey("mwav.net");
		byte[] actuals = securityLib.generateKey("mwav.net");
		assertArrayEquals(expecteds, actuals);
	}

	@Test
	public void ivTest() throws Exception {
		SecurityLib securityLib = SecurityLib.getInstance();

		byte[] expecteds = securityLib.generateIv("mwav");
		byte[] actuals = securityLib.generateIv("mwav");
		assertArrayEquals(expecteds, actuals);
	}

	@Test
	public void encryptTest() throws Exception {
		SecurityLib securityLib = SecurityLib.getInstance();
		
		byte[] expecteds = securityLib.encrypt("mwav.net", "mwav", "ehdgml90@");
		byte[] actuals = securityLib.encrypt("mwav.net", "mwav", "ehdgml90@");
		
		assertArrayEquals(expecteds, actuals);
	}
	
	@Test
	public void decryptTest() throws Exception {
		SecurityLib securityLib = SecurityLib.getInstance();
		String encrypted = securityLib.encryptToString("mwav.net", "mwav", "ehdgml90@");
		String decrypted = securityLib.decryptToString("mwav.net", "mwav", encrypted);
		
		assertArrayEquals("ehdgml90@".toCharArray(), decrypted.toCharArray());
	}
}
