package classs;

public class Array2 {

	public static void main(String[] args) {
		//배열 길이 : 코드에서 배열의 길이를 얻으려면 다음과 같이 배열 객체의 length 필드를 읽습니다.
		
		 int[] numbers = new int[5]; // 길이가 5인 배열 생성
	        numbers[0] = 10;
	        numbers[1] = 20;
	        numbers[2] = 30;
	        numbers[3] = 40;
	        numbers[4] = 50;

	        // 문자열 배열 선언과 초기화
	        String[] names = {"Alice", "Bob", "Charlie", "David", "Emily"};

	        // 배열 순회 및 값 출력
	        System.out.println("정수형 배열 출력:");
	        for (int i = 0; i < numbers.length; i++) {
	            System.out.println("numbers[" + i + "] = " + numbers[i]);
	        }

	        System.out.println("\n문자열 배열 출력:");
	        for (int i = 0; i < names.length; i++) {
	            System.out.println("names[" + i + "] = " + names[i]);
	        }
	    }
	}


