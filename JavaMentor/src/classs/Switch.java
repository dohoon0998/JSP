package classs;

import java.util.Scanner;

public class Switch {

	public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        String str = sc.nextLine();
        
        // switch(변수) {
        
        // case 값1:
        // 실행문A
        // break;
        // }
        
        switch (str) {
		case "A": //변수가 값A일 경우
			System.out.println("최우수상이네");
			break;
		case "B": //변수가 값B일 경우
			System.out.println("우수상이네");
			break;
		case "C": //변수가 값C일 경우
			System.out.println("좀 아쉽네");
			break;		
		default: //변수가 값A, B, C 모두 아닐 경우
			System.out.println("존나 못하네");
		}
    }
}
