#include <bits/stdc++.h>

using namespace std;

int main(int argc, char const *argv[])
{
	
	#ifdef DBG
	freopen("input.in","r",stdin);
	freopen("output.out","w",stdout);
	#endif

	unsigned int number,tmp;
	scanf("%u",&number);

	tmp = number;
	unsigned int Bits[32],i,j;
	memset(Bits,0,sizeof(Bits));

	for(i=0;i<32;i++){
		Bits[i] = tmp%2;
		tmp = tmp/2;
		if(tmp==0)
			break;
	}

	printf("Before bits are reversed:\n");
	printf("%u =", number);
	tmp = 0;
	for(i=0;i<32;i++){
		if( i%8 == 0 )
			printf(" ");

		printf("%u",Bits[31-i] );
		tmp = tmp + Bits[31-i]*pow(2,i);
	}
	printf("\n");
	printf("After bits are reversed:\n");
	printf("%u =",tmp );
	for(i=0;i<32;i++){
		if( i%8 == 0 )
			printf(" ");
		printf("%u",Bits[i] );
	}
	printf("\n");

	return 0;
}