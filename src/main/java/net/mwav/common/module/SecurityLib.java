package net.mwav.common.module;

import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.SecretKeySpec;

public class SecurityLib {
	private SecurityLib() {
	}

	private static class SecurityLibHolder {
		private static final SecurityLib securityLib = new SecurityLib();
	}

	public static SecurityLib getInstance() {
		return SecurityLibHolder.securityLib;
	}

	// - generate 128 bits secret key
	public Key generateKey(String algorithm, int keysize) throws NoSuchAlgorithmException {
		KeyGenerator keyGenerator = KeyGenerator.getInstance(algorithm);
		keyGenerator.init(keysize);
		return keyGenerator.generateKey();
	}

	// - encrypt to 128
	public byte[] encryptAES128(byte[] key, String text) throws Exception {
		return encrypt(key, "AES", "AES/CBC/NoPadding(128)", text);
	}

	public byte[] decryptAES128(String key) {
		return null;
	}

	private byte[] encrypt(byte[] key, String algorithm, String transformation, String text) throws Exception {
		Key spec = new SecretKeySpec(key, algorithm);
		Cipher cipher = Cipher.getInstance(transformation);
		cipher.init(Cipher.ENCRYPT_MODE, spec);

		return cipher.doFinal(text.getBytes());
	}
}
