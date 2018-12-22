import java.util.Scanner;
import java.io.*;

public class uva100{
	public static int[] table = new int[1000005] ;
	public static void main(String[] args) throws IOException{

		FileInputStream instream = null;
        PrintStream outstream = null;
        instream = new FileInputStream("input.in");
        outstream = new PrintStream("output.out");
        System.setIn(instream);
        System.setOut(outstream);

		for(int i = 1 ; i < 10005 ; i++ ){
			int tmp = i;
			int tmp_ans = 1;
			while( tmp != 1 ){
				if( tmp%2 == 0 )
					tmp = tmp/2;
				else
					tmp = tmp*3 + 1;
				tmp_ans++;
			}
			table[i] = tmp_ans;
		}
		Scanner in = new Scanner(System.in);
		int one,two,ans;
		while( in.hasNext() ){
			one = in.nextInt();
			two = in.nextInt();
			System.out.print(one+" "+two+" ");
			if( two < one ){
				int tmp = one;
				one = two;
				two = tmp;
			}
			ans = 0;
			for(int i = one ; i <= two ; i++ )
				if( table[i] > ans )
					ans = table[i];
			System.out.println(ans);
		}
	}
}