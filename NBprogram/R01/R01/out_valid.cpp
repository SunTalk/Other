#include <bits/stdc++.h>

using namespace std;

int main()
{
	freopen("R01_5.out", "r", stdin);
	int total, w, v;
	cin >> 	total;
	
	int tW = 0, vW = 0;
	
	while(cin >> w >> v)
	{
		tW += w;
		vW += v;
	}
	cout << total << '\n' << tW << ' ' << vW << '\n';
	
	return 0;
}
