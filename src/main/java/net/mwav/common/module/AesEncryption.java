package net.mwav.common.module;

import java.io.IOException;
import java.util.Arrays;
 
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
// 아파치로 변경 예정



//자바 API https://docs.oracle.com/javase/7/docs/api/javax/crypto/Cipher.html
//https://docs.oracle.com/javase/7/docs/api/
        //http://changki.net/ (한글)

//http://jo.centis1504.net/?p=137
//http://m.blog.daum.net/_blog/_m/articleView.do?blogid=0Z2do&articleno=2
//http://www.enjoydev.com/memo/405
//http://m.blog.daum.net/pikisvill/8929174
//http://www.imcore.net/encrypt-decrypt-aes256-c-objective-ios-iphone-ipad-php-java-android-perl-javascript-python/ :  언어별 암호화 자바스크립트 쪽 참고


// 150829 private에서 public 로 변경 (타 클래스에서 접근을 위해서)
/*
 2. CBC(Cipher Block Chaining) Mode
- 블록 암호화 운영 모드 중 보안 성이 제일 높은 암호화 방법으로 가장 많이 사용된다.
- 평문의 각 블록은 XOR연산을 통해 이전 암호문과 연산되고 첫번째 암호문에 대해서는 IV(Initial Vector)가 암호문 대신 사용된다. 이 때, IV는 제 2의 키가 될수 있다.
- 암호문이 블록의 배수가 되기 때문에 복호화 후 평문을 얻기 위해서 Padding을 해야만 한다.
   padding :  속, 충전재 - http://acaasia.blogspot.kr/2013/07/padding-mode.html
- 암호화가 병렬처리가 아닌 순차적으로 수행되어야 한다. (단점)
 */
public class AesEncryption {
 
    public static final String sKey = "Mwav.net";
    public static final String sInitVector = "Mwav";
    
    
    //ECB 시작
	public static byte[] aesEncryptEcb(String sKey, String sText) { //1. ECB 모드로 암호화 
        byte[] key = null;
        byte[] text = null;
        byte[] encrypted = null;
        final int AES_KEY_SIZE_128 = 128;
 
        try {
            // UTF-8
            key = sKey.getBytes("UTF-8"); // 키 
 
            // Key size 맞춤 (128bit, 16byte)
            // Arrays 에는 null 부터 ~ 128bit / 8 까지 담긴다.
            key = Arrays.copyOf(key, AES_KEY_SIZE_128 / 8); 
 
            // UTF-8
            text = sText.getBytes("UTF-8");
 
            // AES/EBC/PKCS5Padding
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding"); // 객체생성 싱글톤패톤 적용으로 매번 객체 생성하지 않고 static 하게 생성하고 사용하기 위하여
                                                                        // 네이밍 규칙있음
            cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"));
            //ENCRYPT_MODE : Constant used to initialize cipher to encryption mode.
            /*
             init(int opmode, Key key)
             : Initializes this cipher with a key.
             */

            encrypted = cipher.doFinal(text);
            /*
             doFinal(byte[] input)
               Encrypts or decrypts data in a single-part operation, or finishes a multiple-part operation.
             */
            
        } catch (Exception e) {
            encrypted = null;
            e.printStackTrace();
        }
 
        return encrypted;
    }
 
    public static byte[] aesDecryptEcb(String sKey, byte[] encrypted) { // 복호화
        byte[] key = null;
        byte[] decrypted = null;
        final int AES_KEY_SIZE_128 = 128;
 
        try {
            // UTF-8
            key = sKey.getBytes("UTF-8");
 
            // Key size 맞춤 (128bit, 16byte)
            key = Arrays.copyOf(key, AES_KEY_SIZE_128 / 8);
 
            // AES/EBC/PKCS5Padding
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"));
            decrypted = cipher.doFinal(encrypted);
        } catch (Exception e) {
            decrypted = null;
            e.printStackTrace();
        }
 
        return decrypted;
    }
 
    
    //ECB 끝
    
    
    //CBC 시작
    public static byte[] aesEncryptCbc(String sKey, String sText) {
        return aesEncryptCbc(sKey, sText, "");
    }
 
    public static byte[] aesDecryptCbc(String sKey, byte[] encrypted) {
        return aesDecryptCbc(sKey, encrypted, "");
    }
 
    public static byte[] aesEncryptCbc(String sKey, String sText, String sInitVector) { //IV 까지 추가 
        byte[] key = null;
        byte[] text = null;
        byte[] iv = null;
        byte[] encrypted = null;
        final int AES_KEY_SIZE_128 = 128;
 
        try {
            // UTF-8
            key = sKey.getBytes("UTF-8");
 
            // Key size 맞춤 (128bit, 16byte)
            key = Arrays.copyOf(key, AES_KEY_SIZE_128 / 8);
 
            // UTF-8
            text = sText.getBytes("UTF-8");
 
            if (sInitVector != null) {
                // UTF-8
                iv = sInitVector.getBytes("UTF-8");
 
                // Key size 맞춤 (128bit, 16byte)
                iv = Arrays.copyOf(iv, AES_KEY_SIZE_128 / 8);
 
                // AES/EBC/PKCS5Padding
                Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                IvParameterSpec ips = new IvParameterSpec(iv);
                
                //IvParameterSpec 초기화 벡터(IV) 지정 IV바이로 사용하여 해당 객체 생성
                cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"), ips);
                
                /*
                 * init(int opmode, Key key, AlgorithmParameterSpec params, SecureRandom random)
                    Initializes this cipher with a key, a set of algorithm parameters, and a source of randomness.
                 */
                encrypted = cipher.doFinal(text);
            } else {
                // AES/EBC/PKCS5Padding
                Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"));
                encrypted = cipher.doFinal(text);
            }
        } catch (Exception e) {
            encrypted = null;
            e.printStackTrace();
        }
 
        return encrypted;
    }
 
    public static byte[] aesDecryptCbc(String sKey, byte[] encrypted, String sInitVector) {
        byte[] key = null;
        byte[] iv = null;
        byte[] decrypted = null;
        final int AES_KEY_SIZE_128 = 128;
 
        try {
            // UTF-8
            key = sKey.getBytes("UTF-8");
 
            // Key size 맞춤 (128bit, 16byte)
            key = Arrays.copyOf(key, AES_KEY_SIZE_128 / 8);
 
            if (sInitVector != null) {
                // UTF-8
                iv = sInitVector.getBytes("UTF-8");
 
                // Key size 맞춤 (128bit, 16byte)
                iv = Arrays.copyOf(iv, AES_KEY_SIZE_128 / 8);
 
                // AES/EBC/PKCS5Padding
                Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                IvParameterSpec ips = new IvParameterSpec(iv);
                cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), ips);               
                decrypted = cipher.doFinal(encrypted);
            } else {
                // AES/EBC/PKCS5Padding
                Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"));
                decrypted = cipher.doFinal(encrypted);
            }
        } catch (Exception e) {
            decrypted = null;
            e.printStackTrace();
        }
 
        return decrypted;
    }
 
    public static String toHexString(byte[] b) {  // 바이트 배열을 16진수 문자열로 
    	                                          // aes 암호화는 128 , 192, 256비트인 키를 사용하기 때문에 16자리의 문자로 변환하여 사용해야 한다. 
    	StringBuffer sb = new StringBuffer();
 
        for (int i = 0; i < b.length; i++) {
            sb.append(String.format("%02X", b[i]));
            if ((i + 1) % 16 == 0 && ((i + 1) != b.length)) {
                sb.append(" ");
            }
        }
 
        return sb.toString();
    }
    
    //BaseDecoding http://huikyun.tistory.com/70 아파치 or sun 은 자유 
    //Base 64란 8비트(=1바이트) 데이터를 문자코드에 영향을 받지 않는 공통 ASCII 문자로 이루어진 6비트 데이터로 변환하는 것이다. 
    //http://118k.tistory.com/34
    public static byte[] aesDecodeBuf (String decryptVariable) throws IOException{
    
    	byte[] decryptVarDecoding = null;
    	decryptVarDecoding = new BASE64Decoder().decodeBuffer(decryptVariable);  // 2진데이터를 문자로 변경 
		
    	return decryptVarDecoding;
    }
    
  //BaseEncoding  암호화된 기본 값이 base64 encode
    public static String aesEncodeBuf (byte[] encryptVariable) throws IOException{ 
    
    	String encryptEncoding = new BASE64Encoder().encode(encryptVariable);
		
    	return encryptEncoding;
    }
    
    private byte[] hexToByteArray(String s) { // 16진수 문자열을 바이트 배열로
        byte[] retValue = null;
        if (s != null && s.length() != 0) {
            retValue = new byte[s.length() / 2];
            for (int i = 0; i < retValue.length; i++) {
                retValue[i] = (byte) Integer.parseInt(s.substring(2 * i, 2 * i + 2), 16);
            }
        }
        return retValue;
    }
    
    
    
    //테스트 결과 확인.
 
    public static void main(String[] args){
        String sKey = "ABC";
        String sText = "123";
        String sInitVector = "123가나다";
        byte[] encrypted = null;
        byte[] decrypted = null;
 
        try {
            System.out.println("* AES/ECB");
            System.out.println("    - KEY : " + sKey);
            System.out.println("    - TEXT : " + sText);
 
            // AES/ECB 암호화
            encrypted = aesEncryptEcb(sKey, sText);
 
            // AES/ECB 복호화
            decrypted = aesDecryptEcb(sKey, encrypted);
 
            if (encrypted == null) {
                System.out.println("    - Encrypted : ERROR!!!");
            } else {
                System.out.println("    - Encrypted : " + toHexString(encrypted));
            }
 
            if (decrypted == null) {
                System.out.println("    - Decrypted : ERROR!!!");
            } else {
                System.out.println("    - Decrypted : " + new String(decrypted, "UTF-8"));
            }
 
            System.out.println("* AES/CBC");
            System.out.println("    - KEY : " + sKey);
            System.out.println("    - TEXT : " + sText);
            System.out.println("    - IV : (Empty)");
 
            // AES/CBC 암호화
            encrypted = aesEncryptCbc(sKey, sText);
 
            // AES/CBC 복호화
            decrypted = aesDecryptCbc(sKey, encrypted);
 
            if (encrypted == null) {
                System.out.println("    - Encrypted : ERROR!!!");
            } else {
                System.out.println("    - Encrypted : " + toHexString(encrypted));
            }
 
            if (decrypted == null) {
                System.out.println("    - Decrypted : ERROR!!!");
            } else {
                System.out.println("    - Decrypted : " + new String(decrypted, "UTF-8"));
            }
 
            System.out.println("* AES/CBC/IV");
            System.out.println("    - KEY : " + sKey);
            System.out.println("    - TEXT : " + sText);
            System.out.println("    - IV : " + sInitVector);
 
            // AES/CBC/IV 암호화
            encrypted = aesEncryptCbc(sKey, sText, sInitVector);
            
            //encrypted = Arrays.toString(aesEncryptCbc(sKey, sText, sInitVector));
 
            // AES/CBC/IV 복호화
            decrypted = aesDecryptCbc(sKey, encrypted, sInitVector);
 
            if (encrypted == null) {
                System.out.println("    - Encrypted : ERROR!!!");
            } else {
                System.out.println("    - Encrypted : " + toHexString(encrypted));
            }
 
            if (decrypted == null) {
                System.out.println("    - Decrypted : ERROR!!!");
            } else {
                System.out.println("    - Decrypted : " + new String(decrypted, "UTF-8"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}