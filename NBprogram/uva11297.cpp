#include <bits/stdc++.h>

using namespace std;

typedef vector<int> vi;
typedef vecotr< vector<int> > vvi;

vvi Tree;
vi Data;

void Tree_1D_build( vi data , int matrix[][] , L , R , seat ){
	
}

void Tree_2D_build( vvi tree , vi data , L , R , seat ){

}

int main(int argc, char const *argv[])
{

	#ifdef DBG
	freopen("input.in","r",stdin);
	freopen("output.out","w",stdout);
	#endif

	int number;
	scanf("%d",&number);

	int matrix[number][number],i,j;

	Tree.resize(number*4);
	for(i = 0; i < number*4 ; i++)
		Tree[i].resize(number*4);
	Data.resize(number*4);





	return 0;
}