#include <bits/stdc++.h>
using namespace std;

#define PROBREM "E"

int main(int argc, char const *argv[])
{
	
	#ifdef DBG
	freopen( PROBREM ".in" , "r", stdin );
	freopen( PROBREM ".out" , "w", stdout );
	#endif

	pair <int, int> start;
	pair <int, int> end;
	int times;

	scanf("%d",&times);
	int CASE = 1;

	while( times-- ){
		
		int ans = 0;
		scanf("%d %d %d %d", &start.first, &start.second, &end.first, &end.second);

		while(1){

			if( start.second == 0 ){
				if( start.first == 0 )
					start.second = 1;
				else{
					swap(start.first,start.second);
					start.second++;
				}
			}
			else{
				start.first++;
				start.second--;
			}
			ans++;
			if( start.first == end.first && start.second == end.second ){
				printf("Case %d: %d\n",CASE,ans );
				break;
			}

		}

		CASE++;

	}

	return 0;
}