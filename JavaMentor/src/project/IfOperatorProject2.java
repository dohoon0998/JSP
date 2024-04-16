package project;

import java.util.Scanner;

public class IfOperatorProject2 {

	public static void main(String[] args) {
		
		
		// 1. 사용자로부터 연도와 월을 입력받는다.
		// 2. 입력받은 연도가 윤년인지 판별하는 기능을 구현한다.
		// ( 연도가 4로 나누어 떨어지면 윤년임 )
		// ( 그 중 100으로 나누어 떨어지는 연도는 윤년이 아님 )
		// ( but 400으로 나누어 떨어지는 연도는 다시 연년임 )
		// 3. 입력받은 월의 일수를 출력한다. 2월의 경우, 윤년 여부에 따라 28일 또는 29일이다.
		// 4. 조건문과 연산자를 사용하여, 각 월에 해당하는 일수를 정확히 출력해야 한다.
		
		//힌트 switch, if
		
		//구글링 가능
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
				
		Scanner sc = new Scanner(System.in);
		
		System.out.println("연도를 입력하세요!");
		int year = sc.nextInt();
		
		System.out.println("월을 입력하세요!");
		int month = sc.nextInt();
		
		int daysInMonth = 0;
		switch(month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			daysInMonth = 31;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			daysInMonth = 30;
			break;
		case 2:
			if((year % 4 == 0 && 100 != 0) || (year % 400 == 0 )) {
				daysInMonth = 29;
			} else {
				daysInMonth = 28;
			}
			break;
			default :
				System.out.println("잘못된 월을 입력하셨습니다!");
				break;
		}
		
		if(daysInMonth != 0) {
			System.out.printf("%d년 %d월은 %d일까지 있습니다 \n", year, month, daysInMonth);
		}
		sc.close();
	}

}
