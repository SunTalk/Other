import java.util.Scanner;

class P1{
	public static void main(String[] args){
		Scanner in = new Scanner(System.in);
		int n = in.nextInt();
		int[] h = new int[n];
		
		for(int k=0;k<n;k++)h[k]=in.nextInt();
		int c=0;
		for(int k=1;k<n-1;k++){
			if(h[k]>h[k-1] && h[k]>h[k+1])c++;
		}
		System.out.println(c);
		System.out.println("-");
		System.out.println(h[0]);
		for(int k=1;k<n-1;k++){
			if(h[k]>h[k-1] && h[k]>h[k+1])System.out.println(h[k]+">>>>>");
			else System.out.println(h[k]);
		}
		System.out.print(h[n-1]);
	}
}
