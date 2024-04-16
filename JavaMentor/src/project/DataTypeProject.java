package project;

public class DataTypeProject {

	public static void main(String[] args) {
				
		byte b = 100;         
		short s = 450;
		int i = 1000;
		long l = 1500;			
		char ch = '꾼'; 
		String str = "사냥";		
		float f = 45; 
		double d = 15.5;		
		boolean stop = false;
		boolean go = true;
		
		//아래의 결과값을 코딩하지 않고 예측하시오//
		System.out.println(b + s);
		System.out.println(s);
		System.out.println(i + l - b);
		System.out.println(l);
		System.out.println(ch);
		System.out.println(str);
		System.out.println(str + ch);
		System.out.println(f);
		System.out.println(f + d);
		System.out.println(go);
		System.out.println(stop);
		
	}
}