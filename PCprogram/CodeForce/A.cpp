#include <bits/stdc++.h>

using namespace std;

#define TESTC ""
#define PROBLEM "A"

#define USE_CPPIO() ios_base::sync_with_stdio(0); cin.tie(0)

int main(int argc, char const *argv[])
{
	#ifdef DBG
	freopen( PROBLEM TESTC ".in", "r", stdin);
	freopen( PROBLEM ".out", "w", stdout);
	#endif

	int number,count,i;
	char input;
	count = 0;

	scanf("%d",&number);
	getchar();
	for( i = 0 ; i < number ; i++ ){
		scanf("%c",&input);
		if(input == '8')
			count++;
	}

	if( count >= number/11 )
		printf("%d\n",number/11 );
	else
		printf("%d\n",count );


	return 0;
}