/**
 * 
 */
package com.megainfo.random;

import java.util.Random;

/**
 * @author rkaruti
 *
 */
public class RandomNumberGenerator {

	/**
	 * 
	 */
	public RandomNumberGenerator() {

	}

	public static String getRSAKey() {
		Random rand = new Random();
		String r = "";
		for (int j = 0; j < 1; j++) {
			long random = rand.nextLong();
			long a = random % 10;
			if (a == 0) {
				r = Long.toString(random);
			} else {
				random = random + a;
				r = Long.toString(random);
			}
			System.out.println(r.substring(3, 12));
		}
		String prikey = r.substring(3, 12);
		return prikey;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String key = RandomNumberGenerator.getRSAKey();
		System.out.println("Key - " + key);
	}
}
