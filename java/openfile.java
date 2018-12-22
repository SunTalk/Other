import java.util.Scanner;
import java.io.*;

public class openfile{
	public static void main(String[] args) throws IOException{
		// openfile                        ^ this is must be
		FileInputStream instream = null;
		PrintStream outstream = null;
		instream = new FileInputStream("input.in");
		outstream = new PrintStream("output.out");
		System.setIn(instream);
		System.setOut(outstream);
		// end openfile
		Scanner in = new Scanner(System.in);
		
		int[] arr = new int[100];
		int[][] arr2 = new int[100][100];

		String str = in.nextLine();
		System.out.println(str);

		float fnum = in.nextFloat();
		System.out.printf("%f\n",fnum);

		double dnum = in.nextDouble();
		System.out.println(dnum); // will print until .14
		System.out.printf("%.9f\n",dnum);//.10 will 4 out 5 in
		//not have %lf & if use %f will only print until .6

		int num;
		while( in.hasNext() ){
			num = in.nextInt();
			System.out.println(num);
		}

	}
}