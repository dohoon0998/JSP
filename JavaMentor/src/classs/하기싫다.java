package classs;

import java.util.Scanner;

public class 하기싫다 {

	public static void main(String[] args) {
Scanner sc = new Scanner(System.in);
        
        System.out.println("학생 수를 입력해주세요.");
        //학생수
        int a = sc.nextInt();
        
        //배열 생성
        int[] b = new int[a];
        
        int max = b[0];
        
        double d = 0;
        
        for(int i=0; i < b.length; i++) {
            System.out.println("점수를 입력해주세요");
            //점수값
            int c = sc.nextInt();
            
            b[i]= c; 
            if(b[i] > max) {
                max = b[i];
            }
            
            d += b[i];
        }
        double f = d / a;
        System.out.println("최고점수"+max);
        System.out.println("평균점수"+f);
    }
    }

	


