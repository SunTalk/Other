#include <stdio.h>
#include <stdlib.h>

int main( )
{
    int n;
    while(scanf("%d",&n)!=EOF)
    {
        if(!n){break;}
        int i,ui=1,tmp=0;
        char a[500005]={0};
        for(i=1;;i++)
        {
            if(tmp==n-1){break;}
            if(i>n){i=1;}
            ui++;
            if(a[i]==1){ui--;continue;}
            if(ui%2==0&&a[i]==0){ui=0;a[i]=1;tmp++;}
        }
        for(i=1;i<=n;i++){if(!a[i]){printf("%d\n",i);break;}}
    }
    return 0;
}
