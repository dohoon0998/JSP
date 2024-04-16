package classs;

public class Array1 {

	public static void main(String[] args) {
		//배열 : 같은 타입의 데이터를 연속된 공간에 나열하고, 각 데이터에 인덱스를 부여해놓은 자료구조임
		//인덱스는 1부터 시작하는게 아닌 0부터 시작함
		//int 배열은 int값만 저장 가능하고, String배열은 문자열만 저장가능함
		
		//배열 선언 예시
		//int[] i = new int[3];
		//i[0];
		//i[1];
		//i[2];
		
		//int[] i = new int[] {10, 20, 30};
		
		
		int[] arr = new int[3];
		arr[0] = 10; 
		arr[1] = 20;
		arr[2] = 30;
		
		for(int i=0; i<3; i++) {
			System.out.println("arr[" + i + "] : " + arr[i]);
		}
		
		
		
		System.out.println("-------------------------------------------");
		
		
		
		
		String[] str = new String[] {"도훈", "은혁", "인혁"};
		
		for(int n=0; n<3; n++) {
			System.out.println("str[" + n + "] : " + str[n]);
		}
		
	}

}
