package classs;

import java.util.Scanner;

public class 시발인원존나많어 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

        // 첫 번째 숫자 입력
        System.out.print("첫 번째 숫자를 입력하세요: ");
        int num1 = scanner.nextInt();

        // 두 번째 숫자 입력
        System.out.print("두 번째 숫자를 입력하세요: ");
        int num2 = scanner.nextInt();

        scanner.nextLine();
        // 연산자 입력
        System.out.print("연산자를 입력하세요(+, -, *, /): ");
        String operator = scanner.nextLine();

        int result = 0;

        // 입력된 연산자에 따라 연산 수행
        switch (operator) {
            case "+":
                result = num1 + num2;
                break;
            case "-":
                result = num1 - num2;
                break;
            case "*":
                result = num1 * num2;
                break;
            case "/":
                if (num2 != 0) {
                    result = num1 / num2;
                } else {
                    System.out.println("0으로 나눌 수 없습니다.");
                    return; // 프로그램 종료
                }
                break;
            default:
                System.out.println("올바른 연산자를 입력하세요.");
                return; // 프로그램 종료
        }

        // 결과 출력
        System.out.println(num1 + " " + operator + " " + num2 + " = " + result);

  

	}

}
