#include <bits/stdc++.h>

using namespace std;

const string name = "R01_";

void genData(int n, int i, bool t = false)
{
	freopen((name + to_string(i) + ".in").c_str() , "w", stdout);
	
	int m = rand() % 1000 + 1;
	if(t)
		m = 1000;
	printf("%d %d\n", n, m);
	

	for(int i = 0; i < n; i++)
		printf("%d %d\n", rand() % 10 + 1, rand() % 100 + 1);

}

int main()
{
	srand(time(NULL));
	int n[] = {10, 50, 100, 500, 1000};
	
	for(int i = 0; i < 5; i++)
	{
		genData(n[i], i+1);
	}

	genData(1000, 5, true);

	return 0;
}
