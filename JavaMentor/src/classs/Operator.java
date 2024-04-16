package classs;

public class Operator {

	public static void main(String[] args) {
		int i = 5;
        int n = 10;

        // 증감 연산자 사용
        System.out.println("i의 현재 값: " + i); // 출력: i의 현재 값: 5
        System.out.println("n의 현재 값: " + n); // 출력: n의 현재 값: 10

        i++; // a를 1 증가
        --n; // b를 1 감소

        System.out.println("i를 1 증가한 후의 값: " + i); // 출력: i를 1 증가한 후의 값: 6
        System.out.println("n를 1 감소한 후의 값: " + n); // 출력: n를 1 감소한 후의 값: 9

        
        
        //--------------------------------증감연산자--------------------------------
        System.out.println();
        System.out.println("^^^^");
        System.out.println("||||");
        System.out.println("--------------------------------증감연산자--------------------------------");
        System.out.println();

		String firstName = "도제";
        String lastName = "짱짱";

        // 결합 연산자를 사용하여 문자열을 결합합니다.
        String fullName = firstName + lastName;

        // 결과 출력
        System.out.println("Full Name: " + fullName);
        
        //--------------------------------결합연산자--------------------------------
        System.out.println();
        System.out.println("^^^^");
        System.out.println("||||");
        System.out.println("--------------------------------결합연산자--------------------------------");
        System.out.println();
        
        int num1 = 5;
        int num2 = 10;

        // 더 큰지 비교
        if (num1 > num2) {
            System.out.println("num1은 num2보다 큽니다.");
        } else if (num1 < num2) {
            System.out.println("num1은 num2보다 작습니다.");
        } else {
            System.out.println("num1과 num2는 같습니다.");
        }

        // 같은지 비교
        String str1 = "hello";
        String str2 = "world";

        if (str1.equals(str2)) {
            System.out.println("str1과 str2는 같습니다.");
        } else {
            System.out.println("str1과 str2는 다릅니다.");
        }

        // 논리 연산자를 사용하여 조건 결합하기
        int age = 25;
        boolean isStudent = false;

        if (age >= 18 && !isStudent) {
            System.out.println("성인이며 학생이 아닙니다.");
        } else {
            System.out.println("미성년자이거나 학생입니다.");
        }
        
      //--------------------------------비교연산자--------------------------------
        System.out.println();
        System.out.println("^^^^"); 
        System.out.println("||||");
        System.out.println("--------------------------------비교연산자--------------------------------");
        System.out.println();
        
     // AND 연산자 (&&)
        int a = 5;
        int b = 10;

        if (a > 0 && b > 0) {
            System.out.println("두 숫자 모두 양수입니다.");
        }

        // OR 연산자 (||)
        boolean isRaining = true;
        boolean isSnowing = false;

        if (isRaining || isSnowing) {
            System.out.println("비가 오거나 눈이 내립니다.");
        }

        // NOT 연산자 (!)
        boolean isSunny = true;

        if (!isSunny) {
            System.out.println("흐린 날씨입니다.");
        } else {
            System.out.println("맑은 날씨입니다.");
        }
        
      //--------------------------------논리연산자--------------------------------
        System.out.println();
        System.out.println("^^^^");
        System.out.println("||||");
        System.out.println("--------------------------------논리연산자--------------------------------");
        System.out.println();
        
     // 대입 연산자 (=)
        int de = 10;
        int ip = 20;

        // 복합 대입 연산자 (+=, -=, *=, /=, %= 등)
        de += 5;  // num1 = num1 + 5 와 동일
        System.out.println("de += 5: " + de);

        ip *= 2;  // num2 = num2 * 2 와 동일
        System.out.println("ip *= 2: " + ip);

        // 대입 연산자를 사용하여 문자열에 값 할당하기
        String message = "Hello";
        message += " World";
        System.out.println(message);
        
      //--------------------------------대입연산자--------------------------------
        System.out.println();
        System.out.println("^^^^");
        System.out.println("||||");
        System.out.println("--------------------------------대입연산자--------------------------------");
        System.out.println();
        
        int sam = 10;
        int hang = 20;

        // 삼항 연산자 (condition ? value1 : value2)
        int max = (sam > hang) ? sam : hang;
        System.out.println("두 수 중 큰 수: " + max);
        
        //--------------------------------삼항연산자--------------------------------
        System.out.println();
        System.out.println("^^^^");
        System.out.println("||||");
        System.out.println("--------------------------------삼항연산자--------------------------------");
        System.out.println();
		
	}

}
