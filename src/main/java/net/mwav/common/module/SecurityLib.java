package net.mwav.common.module;

import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

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

	public byte[] generateKey(String key) throws UnsupportedEncodingException {
		return Arrays.copyOf(key.getBytes("UTF-8"), AES128_SIZE);
	}

	public byte[] generateIv(String iv) throws UnsupportedEncodingException {
		return Arrays.copyOf(iv.getBytes("UTF-8"), AES128_SIZE);
	}

	// Correct order for encrypt: getBytes, encrypt, encode, toString
	public byte[] encrypt(byte[] key, byte[] iv, String text) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));

		return cipher.doFinal(text.getBytes());
	}

	public byte[] encrypt(String key, String iv, String text) throws Exception {
		return encrypt(generateKey(key), generateIv(iv), text);
	}

	public String encryptToString(String key, String iv, String text) throws Exception {
		byte[] encrypted = encrypt(generateKey(key), generateIv(iv), text);
		return new String(Base64.getEncoder().encode(encrypted));
	}

	// Correct order for decrypt: getBytes, decode, decrypt, toString
	public byte[] decrypt(byte[] key, byte[] iv, String text) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));

		byte[] encrypted = Base64.getDecoder().decode(text.getBytes("UTF-8"));
		return cipher.doFinal(encrypted);
	}

	public byte[] decrypt(String key, String iv, String text) throws Exception {
		return decrypt(generateKey(key), generateIv(iv), text);
	}
	
	public String decryptToString(String key, String iv, String text) throws Exception {
		byte[] decrypted = decrypt(generateKey(key), generateIv(iv), text);
		return new String(decrypted);
	}
}
