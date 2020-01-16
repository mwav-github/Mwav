package net.mwav.common.module;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class SecurityLibTest {

	@Test
	public void keyTest() throws Exception {
		SecurityLib securityLib = SecurityLib.getInstance();

		String shortText = "Mwav.net";
		String longText = "ab1234!@#!@$142abqwerthjkasc";

		byte[] expecteds = securityLib.convertToSpec(shortText);
		byte[] actuals = securityLib.convertToSpec(shortText);

		assertArrayEquals(expecteds, actuals);
		assertTrue(securityLib.convertToSpec(longText).length == 16);
	}

	@Test
	public void encryptTest() throws Exception {
		SecurityLib securityLib = SecurityLib.getInstance();

		String key = "Mwav.net";
		String iv = "Mwav";
		String text = "Mwavnet@1";
		String expecteds = "D2yWYgl484fg8OI842BOxQ==";
		String actuals = securityLib.encryptToString(key, iv, text);

		assertArrayEquals(expecteds.toCharArray(), actuals.toCharArray());
	}

	@Test
	public void decryptTest() throws Exception {
		SecurityLib securityLib = SecurityLib.getInstance();

		String key = "Mwav.net";
		String iv = "Mwav";
		String text = "Mwavnet@1";
		String encrypted = securityLib.encryptToString(key, iv, text);
		String decrypted = securityLib.decryptToString(key, iv, encrypted);

		assertArrayEquals(text.toCharArray(), decrypted.toCharArray());
	}
}
