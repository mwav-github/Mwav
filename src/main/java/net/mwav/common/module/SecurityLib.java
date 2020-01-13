package net.mwav.common.module;

import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class SecurityLib {
	private static final int AES128_SIZE = 16;

	private SecurityLib() {
	}

	private static class SecurityLibHolder {
		private static final SecurityLib securityLib = new SecurityLib();
	}

	public static SecurityLib getInstance() {
		return SecurityLibHolder.securityLib;
	}

	// - generate 128 bits secret key
	public Key generateRandomKey(String algorithm, int keysize) throws NoSuchAlgorithmException {
		KeyGenerator keyGenerator = KeyGenerator.getInstance(algorithm);
		keyGenerator.init(keysize);
		return keyGenerator.generateKey();
	}

	// - generate secret key
	public byte[] generateKey(String key) throws UnsupportedEncodingException {
		return Arrays.copyOf(key.getBytes("UTF-8"), AES128_SIZE);
	}

	// - generate iv
	public byte[] generateIv(String iv) throws UnsupportedEncodingException {
		return Arrays.copyOf(iv.getBytes("UTF-8"), AES128_SIZE);
	}

	// - encrypt to 128
	public byte[] encrypt(byte[] key, byte[] iv, String text) throws Exception {
		Key spec = new SecretKeySpec(key, "AES");
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, spec, new IvParameterSpec(iv));

		return cipher.doFinal(text.getBytes());
	}
	
}
