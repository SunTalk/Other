#include <stdio.h>
#include <stdlib.h>
#define BITMASK 1<<31
#define BITMASK1 0xFF000000
#define BITMASK2 0x00FF0000
#define BITMASK3 0x0000FF00
#define BITMASK4 0x000000FF

int main(){

    #ifdef DBG
    freopen("input.in","r",stdin);
    freopen("output.out","w",stdout);
    #endif

    unsigned int value,a,c1,c2,c3,c4;

    scanf("%d",&value);
    a= value;
    printf("The packed character representation is:\n%d =",value);

    for(int i=1;i<=32;i++ ){
        putchar( value&BITMASK? '1' : '0' );
        value <<=1;

        if( i%8==0 ) 
			putchar(' ');
    }

    value= a;
    puts("\n");

    c1= (value&BITMASK1) >>24;
    printf("%d = ",c1);
    for(int i=1;i<=32;i++ ){
        putchar( c1&BITMASK? '1' : '0' );
        c1 <<=1;

        if( i%8==0 ) 
			putchar(' ');
    }
    value= a;
    puts("");

    c2= (value&BITMASK2) >>16;
    printf("%d = ",c2);
    for(int i=1;i<=32;i++ ){
        putchar( c2&BITMASK? '1' : '0' );
        c2 <<=1;

        if( i%8==0 ) 
			putchar(' ');
    }
    value= a;
    puts("");

    c3= (value&BITMASK3) >>8;
    printf("%d = ",c3);
    for(int i=1;i<=32;i++ ){
        putchar( c3&BITMASK? '1' : '0' );
        c3 <<=1;

        if( i%8==0 )
			putchar(' ');
    }
    value= a;
    puts("");

    c4= value&BITMASK4;
    printf("%d = ",c4);
    for(int i=1;i<=32;i++ ){
        putchar( c4&BITMASK? '1' : '0' );
        c4 <<=1;

        if( i%8==0 ) 
			putchar(' ');
    }
    value= a;
    puts("");

    return 0;
}
