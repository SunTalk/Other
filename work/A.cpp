#include <bits/stdc++.h>
using namespace std;

#define PROBREM "A"

int main(int argc, char const *argv[])
{
	
	#ifdef DBG
	freopen( PROBREM ".in" , "r", stdin );
	freopen( PROBREM ".out" , "w", stdout );
	#endif

	int number;
	scanf("%d",&number);
	int mountain[number],i;
	bool head[number];

	memset(mountain,0,sizeof(mountain));
	memset(head,0,sizeof(head));

	for( i = 0 ; i < number ; i++ )
		scanf("%d",&mountain[i]);

	int ans = 0;
	for( i = 1 ; i < number-1 ; i++ ){
		if( mountain[i] > mountain[i-1] && mountain[i] > mountain[i+1] ){
			head[i] = 1;
			ans++;
		}
	}

	printf("%d\n-\n",ans );
	for( i = 0 ; i < number ; i++ ){
		printf("%d",mountain[i] );
		if( head[i] )
			printf(">>>>>");
		printf("\n");
	}


	return 0;
}