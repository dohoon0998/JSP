package classs;

import java.util.Scanner;

public class If {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int i = sc.nextInt();
		
		//  if (조건식1) {
		//  실행문A
		//  } else if (조건식2) {
		//  실행문B
		//  } else if (조건식3) {
		//  실행문C
		//  } else {
		//  실행문D
		//  }
		
		if(i >= 90) { //만약 i가 90 이상이면
			System.out.println("점수가 100~90입니다");
			System.out.println("A");
		} else //i가 90 미만이면 내려감
		if(i >= 80){ //만약 i가 80이상이면
			System.out.println("점수가 80~89입니다");
			System.out.println("B");
		} else //i가 80미만이면 내려감
		if(i >= 70) { //만약 i가 70이상이면
			System.out.println("점수가 70~79입니다");
			System.out.println("C");
		} else { //i가 70 미만이면
			System.out.println("점수가 70미만입니다");
			System.out.println("D");
		}
	}
// < : 미만
// > : 초과
// >= : 이상
// =< : 이하
// == : 같다
}
