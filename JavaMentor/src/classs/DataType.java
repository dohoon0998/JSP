package classs;

import java.util.Scanner;

public class DataType {
	public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
			
		
		//정수 타입
		//보통 int 타입을 많이 씀
		byte b = 127;         
		//byte는 타입 b는 변수
		short s = 32767;
		int i = 2147483647;
		long l = 809321837;
		
		//문자 및 문자열 타입
		char ch = 'a'; //문자 char 타입은 무조건 '작은 따옴표' 사용 한 글자 이상 작성시 에러
		//char 타입 에러 예시 : char ch = '하하하';
		String str = "도제";// 문자열 String 타입은 무조건 "큰 따옴표" 사용 한 글자 이상 작성 가능
		
		//실수형 타입
		//보통 float 타입을 많이 씀
		float f = 3; 
		double d = 333.14;
		
		//결과물을 출력하게 도와주는 것 System.out.println();
		//sysout을 치고 ctrl + space를 누르면 자동완성
		System.out.println(b);
		System.out.println(s);
		System.out.println(i);
		System.out.println(b);
		System.out.println(l);
		System.out.println(ch);
		System.out.println(str);
		System.out.println(f);
		System.out.println(d);
		
		//논리 타입	
		Boolean stop = true;
		
		System.out.println(stop);
		
		//(괄호) {중괄호} [대괄호]
		//java에서는 무조건 한줄이 끝나면 끝났다는 걸 알려주기 위해 세미콜론 작성 ;
		
		}
	}
	//이클립스 사용 x 뭐가 나올지 추측해서 말하기