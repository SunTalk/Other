#include <bits/stdc++.h>
using namespace std;

#define PROBREM "C"

int main(int argc, char const *argv[])
{
	
	#ifdef DBG
	freopen( PROBREM ".in" , "r", stdin );
	freopen( PROBREM ".out" , "w", stdout );
	#endif

	int tmp,i,j;
	bool ans[400000] = {0};
	int fuck[400000] = {0};

	for( i = 1 ; i < 400000 ; i++ ){
		tmp = 0;
		for( j = 1 ; j <= i ; j++ ){
			if( i%j == 0 )
				tmp++;
		}
		if( !ans[tmp] ){
			ans[tmp] = 1;
			fuck[tmp] = i;
		}
	}

	for( i = 1 ; i < 400000 ; i++ ){
		if( fuck[i] != 0 ){
			printf("%d: %d\n",i,fuck[i] );
		}
	}


	return 0;
}