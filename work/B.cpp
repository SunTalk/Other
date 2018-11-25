#include <bits/stdc++.h>
using namespace std;

#define PROBREM "B"
#define MAX 500000

int main(int argc, char const *argv[])
{
	
	#ifdef DBG
	freopen( PROBREM ".in" , "r", stdin );
	freopen( PROBREM ".out" , "w", stdout );
	#endif

	int ans[MAX+5];
	int tmp,i;
	tmp = 1;

	for( i = 1 ; i < MAX+5 ; i++ ){
		ans[i] = tmp;
		if( tmp == i )
			tmp = 2;
		else
			tmp = tmp + 2;
	}

	while( ~scanf("%d",&tmp) )
		printf("%d\n",ans[tmp] );

	return 0;
}