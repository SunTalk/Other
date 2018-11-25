#include <bits/stdc++.h>

using namespace std;

#define TESTC ""
#define PROBLEM "B"

#define USE_CPPIO() ios_base::sync_with_stdio(0); cin.tie(0)

int Num(long long k){

	int tmp,i;
	tmp = 0;
	while( k > 0 ){
		tmp = tmp + k%10;
		k /= 10;
	}
	return tmp;
}

int main(int argc, char const *argv[])
{
	#ifdef DBG
	freopen( PROBLEM TESTC ".in", "r", stdin);
	freopen( PROBLEM ".out", "w", stdout);
	#endif

	long long number;
	scanf("%lld",&number);
	long long tmp,record,i;
	record = number;
	tmp = 0;

	while( record > 9 ){
		tmp = tmp*10 + 9;
		record = record/10; 
	}
	// printf("%lld %lld\n",tmp,record );
	record--;
	while( tmp > 0 ){
		record = record*10 + 9;
		tmp = tmp/10;
	}
	// printf("%lld %lld\n",tmp,record );

	printf("%d\n", Num(record)+Num(number-record) );

	return 0;
}