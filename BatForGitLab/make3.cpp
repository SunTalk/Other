#include <bits/stdc++.h>
using namespace std;

int main(int argc, char const *argv[])
{
	
	freopen("Nothing3.txt","a",stdout);
	srand( (unsigned)time(NULL) );

	string str;
	str = "";
	int low,up;
	low = 32;
	up = 126;
	int tmp;

	for(int i = 0 ; i < 10 ; i++ ){
		tmp = rand() % (up - low + 1) + low;
		char add = tmp;
		str = str + add;
	}

	cout << str ;

	return 0;
}