import java.util.Scanner;

class P3 {
	private static int numDivisor(int n){
		int num=0;
		for(int k=1;k<=n;k++){
			if(n%k==0) num++;
		}
		return num;
	}
	public static void main(String[] args){
		Scanner in = new Scanner(System.in);
		
		int k, n;
		
		while (in.hasNext())
		{
		k=in.nextInt();
		n=1;
		
		while(numDivisor(n)<k)	
			n++;
		
		System.out.println(n);
		}
	}
}