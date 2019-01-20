package com.megainfo.util;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.bouncycastle.util.encoders.Base64;

public class AESUtility {

	private static final String ALGO = "AES";

	static String keyWord = "ef50a0ef2c3e3a5fdf803ae9752c8c66";

	public String encrypt(String Data) throws Exception {

		byte[] keyValue = Data.getBytes();
		Key key = new SecretKeySpec(keyValue, ALGO);
		Cipher c = Cipher.getInstance(ALGO);
		// c.init(Cipher.ENCRYPT_MODE, key);
		String encryptedValue = new String(Base64.encode(Data.getBytes()));
		return encryptedValue;
	}

	public String decrypt(String encryptedData) throws Exception {
		byte[] keyValue = encryptedData.getBytes();
		Key key = new SecretKeySpec(keyValue, ALGO);
		Cipher c = Cipher.getInstance(ALGO);
		// c.init(Cipher.ENCRYPT_MODE, key);
		String decryptedValue = new String(Base64.decode(encryptedData.getBytes()));
		return decryptedValue;
	}

	public static void main(String[] args) {
		String password = "Sujata@123";

		try {
			AESUtility obj = new AESUtility();
			String passwordEnc = obj.encrypt(password);
			String passwordDec = obj.decrypt(passwordEnc);

			System.out.println("Plain Text : " + password);
			System.out.println("Encrypted Text : " + passwordEnc);
			System.out.println("Decrypted Text : " + passwordDec);

		} catch (Exception e) {
			System.out.println("Opps,Exception In AES_EncrypterNdecrypter=>main() :");
			e.printStackTrace();
		}

	}

}
