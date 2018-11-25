#include <bits/stdc++.h>

using namespace std;
// WA
#define TESTC ""
#define PROBLEM "D"

#define USE_CPPIO() ios_base::sync_with_stdio(0); cin.tie(0)

int main(int argc, char const *argv[])
{
	#ifdef DBG
	freopen( PROBLEM TESTC ".in", "r", stdin);
	freopen( PROBLEM ".out", "w", stdout);
	#endif

	long long guest,i;
	scanf("%lld",&guest);
	vector <long long> first;
	vector <long long> last;
	long long one,two;
	long long total=0;
	bool check;

	for( i = 0 ; i < guest ; i++ ){
		scanf("%lld %lld",&one,&two);
		check = 0;
		total++;

		for(int j = 0 ; j < last.size() ; j++ ){
			if( one == last[j] && two == first[j] ){
				first.erase(first.begin()+j);
				last.erase(last.begin()+j);
				check = 1;
			}
		}
		
		if( check == 0 ){
			first.push_back(one);
			last.push_back(two);
			total = total + one + two;
		}

	}

	for(int j = 0 ; j < first.size() ; j++ ){
		if( first[j] > last[j] )
			total = total - last[j];
		else
			total = total - first[j];
	}

	printf("%lld\n",total );

	return 0;
}