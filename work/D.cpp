#include <bits/stdc++.h>
using namespace std;

#define PROBREM "D"
#define MAX 1000000000
int main(int argc, char const *argv[])
{
	
	#ifdef DBG
	freopen( PROBREM ".in" , "r", stdin );
	freopen( PROBREM ".out" , "w", stdout );
	#endif

	int times;
	scanf("%d",&times);

	int ans,tmp,i,j,k;
	int number;

	while( times-- ){

		scanf("%d",&number);

		for( i = number ; i < MAX ; i++ ){
			tmp = i;
			ans = 0;
			while( tmp > 0 ){
				ans = ans+ tmp%10;
				tmp = tmp/10;
			}
			tmp = i;
			for( j = 2 ; j <= tmp ; j++ ){
				while( tmp%j == 0 && j != i && tmp != 0 ){
					k = j;
					while( k > 0 ){
						ans = ans - k%10;
						k = k/10;
					}
					tmp = tmp/j;
				}
			}
			if( ans == 0 ){
				printf("%d\n",i );
				break;
			}

		}

	}

	return 0;
}