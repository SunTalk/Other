#include <bits/stdc++.h>

using namespace std;

#define TESTC ""
#define PROBLEM "bookbook"

#define USE_CPPIO() ios_base::sync_with_stdio(0); cin.tie(0)

#define MAX 1005

int main(int argc, char const *argv[])
{
	#ifdef DBG
	freopen( PROBLEM TESTC ".in", "r", stdin);
	freopen( PROBLEM ".out", "w", stdout);
	#endif

	int i,j;
	int **bag = new int*[MAX];
	for( i = 0 ; i < MAX ; i++ )
		bag[i] = new int[MAX];

	int number,weight;
	scanf("%d %d",&number,&weight);
	int book[number][2];//0-weight,1-value
	
	for( i = 0 ; i < number ; i++ )
		scanf("%d %d",&book[i][0],&book[i][1]);

	for( i = 1 ; i < number ; i++ ){
		j = i;
		while( j != 0 && book[j][0] >= book[j-1][0] ){
			if( ( book[j][0] == book[j-1][0] && book[j][1] < book[j-1][1] ) ){
				j--;
				continue;
			}
			swap(book[j][0],book[j-1][0]);
			swap(book[j][1],book[j-1][1]);
			j--;
		}
	}

	for( i = 0 ; i < number+5 ; i++ )
		for( j = 0 ; j < weight+5 ; j++ )
			bag[i][j] = 0;

	for( i = 0 ; i < number ; i++ )
		for( j = 1 ; j <= weight ; j++ )
			if( j >= book[i][0] )
				bag[i+1][j] = max( book[i][1] + bag[i][j-book[i][0]] , bag[i][j] );

	printf("%d\n",bag[number][weight] );

	while( number != 0 ){
		if( bag[number][weight] != bag[number-1][weight] ){
			printf("%d %d\n",book[number-1][0],book[number-1][1] );
			weight = weight - book[number-1][0];
		}
		number--;
	}

	for( i = 0; i < MAX ; i++)
	    delete [] bag[i];
	delete [] bag;

	return 0;
}