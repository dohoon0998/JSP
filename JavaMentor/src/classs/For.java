package classs;

import java.util.Iterator;

public class For {

	public static void main(String[] args) {
		//1. for문이 처음 실행될 떄 초기화식이 제일 먼저 실행이 된다.
		//2. 조건식을 평가해서 true이면 for문 블록 내부의 실행문을 실행하고, false이면 for문 블록을 실행하지 않고 종료함.
		//3. 블록 내부의 실행문들이 모두 실행되면 증감식을 실행하고 다시 조건식을 평가함.
		//4. 조건식의 평과 결과가 true이면 실행문 > 증감식 > 조건식으로 다시 진행하고, false이면 for문이 종료됨.
		
		//for(초기화식; 조건식; 증감식;) { 조건이 true인 경우
		//	실행문;
		//	}
		
		for(int i=1; i<=5; i++) {
			System.out.println(i);
		}
		
		System.out.println();
		System.out.println();
		System.out.println();
		
		for(int i=1; i<=5; i++) {
			System.out.print(i);
		}
		
		System.out.println();
		System.out.println();
		System.out.println();
		
		for(int i=1; i<=20; i++) {
			if (i % 2 != 0) {
                System.out.print(i + " ");
		}
			
			System.out.println();
			System.out.println();
			System.out.println();
			
		int n = 10;
		
		int sum = 0;
		
		for (int t = 1; t <= n; t++) {
            sum += t;      
            System.out.println("1부터 " + t + "까지의 합: " + sum);
        }
		
		System.out.println();
		System.out.println();
		System.out.println();
		
		for (char ch = 'a'; ch <= 'z'; ch++) {
            System.out.print(ch + " ");
        }
		
		System.out.println();
		System.out.println();
		System.out.println();
		
		int height = 5; // 삼각형의 높이 설정

        // 삼각형을 위한 이중 반복문
        for (int in = 1; in <= height; in++) {
            // 공백 출력
            for (int j = 1; j <= height - in; j++) {
                System.out.print(" ");
            }
            // 별표 출력
            for (int k = 1; k <= in; k++) {
                System.out.print("*");
            }
            // 줄 바꿈
            System.out.println();
        }

	}

	}
}
