package project;

import java.util.Scanner;

public class IfOperatorProject {

	public static void main(String[] args) {
		
	
		
		
		// 1. 사용자로부터 세 개의 정수를 입력받는다.
		// 2. 입력한 세 개의 수 중에서 가장 큰 수를 찾아 출력한다.
		// 3. 모든 수는 서로 다르다고 가정한다. 즉, 중복된 수는 입력되지 않는다.
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("첫 번째 정수를 입력하세요!");
		int num1 = sc.nextInt();
		
		System.out.println("두 번째 정수를 입력하세요!");
		int num2 = sc.nextInt();
		
		System.out.println("세 번째 정수를 입력하세요!");
		int num3 = sc.nextInt();
		
		int MaxNum = num1;
		
		if(num2 > MaxNum) {
			MaxNum = num2;
		}
		
		if(num3 > MaxNum) {
			MaxNum = num3;
		}
		
		System.out.println("가장 큰 수는" + MaxNum + "입니다");
		
	}
}