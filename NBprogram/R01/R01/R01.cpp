#include <bits/stdc++.h>

using namespace std;

#define N 1000
#define M 1000

int bag[N+1][M+1];
int w[N], val[N];
int n, m;

void build()
{
	for(int i = 1; i <= n; i++)
		for(int j = 0; j <= m; j++)
			if(j - w[i] >= 0)
				bag[i][j] = max(bag[i-1][j - w[i]] + val[i], bag[i-1][j]);
			else
				bag[i][j] = bag[i-1][j];
}

int main()
{
//	freopen("R01_4.in", "r", stdin);
	
//	int n, m; // n items, m limit
	
	scanf("%d %d", &n, &m);
	
	for(int i = 1; i <= n && ~scanf("%d %d", &w[i], &val[i]); i++);
	
	build();
	
	cout << bag[n][m] << '\n';
	vector<pair<int, int> > take;
	
	while(bag[n][m] > 0)
	{
		// changed
		if(bag[n][m] != bag[n-1][m])
		{
			take.emplace_back(w[n], val[n]);
			m -= w[n];
		}
		n--;
	}
	
	sort(take.begin(), take.end());
	
	for(auto i : take)
		printf("%d %d\n", i.first, i.second);
	
	return 0;
}
