#include <bits/stdc++.h>

using namespace std;

int main(int argc, char const *argv[])
{
	
	#ifdef DBG
	freopen("input.in","r",stdin);
	freopen("output.out","w",stdout);
	#endif

	long long Bits[32]={0};
	long long number,count=0,i;

	while(scanf("%lld",&number)){
		if(number==-1)
			break;
		Bits[number]=1;
	}

	for(i=0;i<32;i++){
		if(Bits[i]==1){
			count++;
			printf("%lld ",i );
		}
	}
	
	printf("\n");

	long long Case=1,tmp,seat;
	while( ~scanf("%lld",&number) ){
		printf("Case %lld: %lld\n", Case,number);
		Case++;
		seat = 0;
		tmp = 0;
		while(number>0){
			if( number%2 == 1 && Bits[seat] == 1 ){
				tmp++;
			}
			seat++;
			number = number>>1;
		}

		if( tmp == count )
			printf("true(all bits 1)\n");
		else
			printf("false(all bits 1)\n");

		if( tmp !=0 )
			printf("true(exist bits 1)\n");
		else
			printf("false(exist bits 1)\n");

	}



	return 0;
}