#include <bits/stdc++.h>

using namespace std;

int main()
{
	freopen("R01_4.in", "r", stdin);
	freopen("R01_4_sort.in", "w", stdout);
	vector<pair<int, int> > vv;
	int w, v;
	int n, m;
	
	cin >> n >> m;
	cout << n << ' ' << m << '\n';
	
	while(n-- && cin >> w >> v)
		vv.emplace_back(w, v);
		
	sort(vv.begin(), vv.end());
	
	
	for(auto i : vv)
		cout << i.first << ' ' << i.second << '\n';
		
	return 0;
}
