package com.corner.util;

import java.security.MessageDigest;

// 이메일 인증할 때 기존에 존재하던 이메일 값에 Hash 값을 적용하여 
// 인증 코드로 링크타고 들어와 인증하게 하는 것 
public class SHA256 {

	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
			
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			// 실제로 사용자가 입력한 값을 SHA-256으로 알고리즘 적용함
			byte[] salt = "Hello! This is Salt.".getBytes();
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			// 해쉬를 적용한 값을 chars 배열 변수에 담는다.
			for(int i = 0; i < chars.length; i++ ) {
				String hex = Integer.toHexString(0xff & chars[i]);
				// 핵스 값과 해쉬 값(chars 인덱스)를 연산
				if(hex.length() == 1 ) {
					result.append('0'); // 16진수 형태
				}
				result.append(hex);
			}
			
		} catch (Exception e) {
			System.out.println(" 오류  : "+e.getMessage());
			e.printStackTrace();
		}
		
		return result.toString();
	}
	
	
}
