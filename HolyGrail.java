import java.util.Scanner;

public class HolyGrail{
	public static void main(String[] args){
		
		Scanner scanner = new Scanner(System.in);
		int a = 100;
		int b = 0;
		
		System.out.println("Wie oft möchtest du denselben Helden vom Holy Grail beschwören?");
		int c = scanner.nextInt();
		
		for(int i = 1; i <= c; i++){
			b += a;
			a += 50;
		}
		System.out.println("Holy Grails benötigt: " + b );
	}
}