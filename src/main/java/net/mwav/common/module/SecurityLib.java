package net.mwav.common.module;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * This class provides the AES/CBC/PKCS5Padding cryption.<p>
 * In order to create SecurityLib object, the application calls {@link #getInstance()} method.<p>
 * 
 * Since AES/CBC/PKCS5Padding cryption requires 128bits(16byte) length of key and iv,<p>
 * cryption methods call {@link #convertToSpec(byte[])} internally to prevent IllegalBlockSizeException.<p>
 * The {@link #encryptToString(String, String, String)} and {@link #decryptToString(String, String, String)}
 * return BASE64 encoded result of cryption.<p>
 * 
 * Order of encryption :
 * <ol>
 * <li>get byte array of text</li>
 * <li>encrypt to AES128</li>
 * <li>encode encrypted text to BASE64</li>
 * <li>convert to String</li>
 * </ol>
 * 
 * Order of decryption :
 * <ol>
 * <li>get byte array of text</li>
 * <li>decode encrypted result to BASE64</li>
 * <li>decrypt</li>
 * <li>convert to String</li>
 * </ol>
 * 
 * <pre>
 * {@code
 * SecurityLib securityLib = SecurityLib.getInstance();
 * String encrypted = securityLib.encryptToString("key", "iv", "password");
 * String decrypted = securityLib.decryptToString("key", "iv", encrypted);
 * //"password".equals(decrypted) may return true
 * }
 * </pre>
 * @author (정) 남동희
 * @since 1.0.1
 * @version v1.0
 * @see javax.crypto.Cipher
 * @see javax.crypto.spec.IvParameterSpec
 * @see javax.crypto.spec.SecretKeySpec
 */
public class SecurityLib {

	/**
	 * Constant used to indicate the length of key and iv in AES128 cryption
	 */
	public static final int AES128_SIZE = 16;

	private static final String ENCODING = StandardCharsets.UTF_8.name();

	private SecurityLib() {
	}

	private static class SecurityLibHolder {
		private static final SecurityLib securityLib = new SecurityLib();
	}

	/**
	 * @return Returns a SecurityLib object
	 */
	public static SecurityLib getInstance() {
		return SecurityLibHolder.securityLib;
	}

	/**
	 * Converts the input to byte array and copies it truncating or padding with zeros.<p>
	 * If the length is greater than 16, truncates until 16th index.<p>
	 * If not, pads with zeros.
	 * <pre>
	 * {@code
	 * String shortKey = "mwav.net";
	 * String adjustedShortKey = new String(convertToSpec(shortKey));// "mwav.net        "
	 * 
	 * String longKey = "abcdefghijklmnopqrs";
	 * String adjustedLongKey = new String(convertToSpec(longKey));// "abcdefghijklmnop"
	 * }
	 * </pre>
	 * 
	 * @param input the input
	 * @return Returns the byte array of size 16
	 * @throws UnsupportedEncodingException if The Character Encoding is not supported
	 * @see java.util.Arrays#copyOf(byte[], int)
	 */
	public byte[] convertToSpec(byte[] input) throws UnsupportedEncodingException {
		return Arrays.copyOf(input, AES128_SIZE);
	}

	/**
	 * Converts the input to byte array and copies it truncating or padding with zeros.<p>
	 * @param input the input
	 * @return Returns the byte array of size 16
	 * @throws UnsupportedEncodingException if The Character Encoding is not supported
	 * @see #convertToSpec(byte[])
	 */
	public byte[] convertToSpec(String input) throws UnsupportedEncodingException {
		return convertToSpec(input.getBytes(ENCODING));
	}

	/**
	 * Encrypt the text to AES128 with given key and iv.<p>
	 * Calls {@link #convertToSpec(byte[])} before encryption.
	 * @param key the key
	 * @param iv the initial vector
	 * @param text the text to encrypt
	 * @return Returns the byte array of encrypted text.
	 * @throws Exception if the key or iv are invalid
	 */
	public byte[] encrypt(byte[] key, byte[] iv, String text) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(convertToSpec(key), "AES"),
				new IvParameterSpec(convertToSpec(iv)));

		return cipher.doFinal(text.getBytes(ENCODING));
	}

	/**
	 * Encrypt the text to AES128 with given key and iv.<p>
	 * @param key the key
	 * @param iv the initial vector
	 * @param text the text to encrypt
	 * @return Returns the byte array of encrypted text.
	 * @throws Exception if the key or iv are invalid
	 * @see #encrypt(byte[], byte[], String)
	 */
	public byte[] encrypt(String key, String iv, String text) throws Exception {
		return encrypt(key.getBytes(ENCODING), iv.getBytes(ENCODING), text);
	}

	/**
	 * Encrypt the text to AES128 with given key and iv and encode it to BASE64.
	 * @param key the key
	 * @param iv the initial vector
	 * @param text the text to encrypt
	 * @return Returns the BASE64 encoded text.
	 * @throws Exception if the key or iv are invalid
	 * @see #encrypt(String, String, String)
	 * @see java.util.Base64
	 */
	public String encryptToString(String key, String iv, String text) throws Exception {
		byte[] encrypted = encrypt(key, iv, text);
		return new String(Base64.getEncoder().encode(encrypted), ENCODING);
	}

	/**
	 * Decrypt the text to AES128 with given key and iv.<p>
	 * Calls {@link #convertToSpec(byte[])} and decode the text to BASE64 before decryption.
	 * @param key the key
	 * @param iv the initial vector
	 * @param text the text to decrypt
	 * @return Returns the byte array of decrypted text.
	 * @throws Exception if the key or iv are invalid
	 */
	public byte[] decrypt(byte[] key, byte[] iv, String text) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(convertToSpec(key), "AES"),
				new IvParameterSpec(convertToSpec(iv)));

		byte[] encrypted = Base64.getDecoder().decode(text.getBytes(ENCODING));
		return cipher.doFinal(encrypted);
	}

	/**
	 * Decrypt the text to AES128 with given key and iv.<p>
	 * @param key the key
	 * @param iv the initial vector
	 * @param text the text to decrypt
	 * @return Returns the byte array of decrypted text.
	 * @throws Exception if the key or iv are invalid
	 * @see #decrypt(byte[], byte[], String)
	 */
	public byte[] decrypt(String key, String iv, String text) throws Exception {
		return decrypt(key.getBytes(ENCODING), iv.getBytes(ENCODING), text);
	}

	/**
	 * Decrypt the text to AES128 with given key and iv, and converts it to the String.
	 * @param key the key
	 * @param iv the initial vector
	 * @param text the text to decrypt
	 * @return Returns a String of the decrypted text.
	 * @throws Exception if the key or iv are invalid
	 * @see #decrypt(String, String, String)
	 */
	public String decryptToString(String key, String iv, String text) throws Exception {
		byte[] decrypted = decrypt(key, iv, text);
		return new String(decrypted, ENCODING);
	}
}
