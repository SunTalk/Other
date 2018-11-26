import java.util.Scanner;

class P2{

public static void main(String[] args )
{
	Scanner in = new Scanner(System.in);
    int n;
    while(in.hasNext())
    {
    	n = in.nextInt();
        if(n == 0){break;}
        int i,ui=1,tmp=0;
        char[] a = new char[500005];
        for(i=1;;i++)
        {
            if(tmp==n-1){break;}
            if(i>n){i=1;}
            ui++;
            if(a[i]==1){ui--;continue;}
            if(ui%2==0&&a[i]==0){ui=0;a[i]=1;tmp++;}
        }
        for(i=1;i<=n;i++){if(a[i]==0)
        {
        System.out.println(i);break;
        }}
    }
    //return 0;
}
}