#include <bits/stdc++.h>

using namespace std;

int test[10];
int tree[40];

void tree_build( int Tree[40], int Need[10], int L,int R, int seat ){
	// 0 10 1
	if(L==R){
		Tree[seat] = Need[L];
	}
	else{

		tree_build( Tree , Need , L , (L+R)/2 , seat*2 );
		tree_build( Tree , Need , ((L+R)/2)+1 , R ,seat*2+1 ); 

		if( Tree[seat*2] > Tree[seat*2+1] )
			Tree[seat]=Tree[seat*2];
		else
			Tree[seat]=Tree[seat*2+1];
	}

}

int main(int argc, char const *argv[])
{
	
	#ifdef DBG
	freopen("input.in","r",stdin);
	freopen("output.out","w",stdout);
	#endif

	memset(test,0,sizeof(test));
	memset(tree,0,sizeof(tree));

	for(int i=0;i<10;i=i+1){
		scanf("%d",&test[i]);
	}

	tree_build(tree,test,0,9,1);

	for(int i=1;i<40;i=i*2){
		for(int j=i; j<i*2 && j<40 ;j=j+1){
			printf("%d ",tree[j] );
		}
		printf("\n");

	}

	return 0;
}