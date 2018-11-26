#include <iostream>
#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;
#define LL long long
#define mid (l+(r-l)/2)
 
const int N=500;
const int INF=0x7fffffff;
 
int maxn[N*4+5][N*4+5];
int minn[N*4+5][N*4+5];
 
bool leaf;
 
void pushUpY(int id,int rt)
{
	maxn[id][rt]=max(maxn[id][rt<<1],maxn[id][rt<<1|1]);
	minn[id][rt]=min(minn[id][rt<<1],minn[id][rt<<1|1]);
}
 
void buildY(int id,int rt,int l,int r)
{
	if(l==r){
		if(leaf){
			int a;
			scanf("%d",&a);
			maxn[id][rt]=minn[id][rt]=a;
		}else{
			maxn[id][rt]=max(maxn[id<<1][rt],maxn[id<<1|1][rt]);//id<<l <=> id*2
			minn[id][rt]=min(minn[id<<1][rt],minn[id<<1|1][rt]);//id<<1|1 <=> id*2+1
		}
	}else{
		buildY(id,rt<<1,l,mid);
		buildY(id,rt<<1|1,mid+1,r);
		pushUpY(id,rt);
	}
}
 
void buildX(int rt,int l,int r,int m)
{// 1 1 n n
	if(l==r){
		leaf=true;
		buildY(rt,1,1,m);
	}else{
		buildX(rt<<1,l,mid,m);
		buildX(rt<<1|1,mid+1,r,m);
		leaf=false;
		buildY(rt,1,1,m);
	}
}
 
void updateY(int id,int rt,int l,int r,int p,int v)
{
	if(l==r){
		if(leaf) maxn[id][rt]=minn[id][rt]=v;
		else{
			maxn[id][rt]=max(maxn[id<<1][rt],maxn[id<<1|1][rt]);
			minn[id][rt]=min(minn[id<<1][rt],minn[id<<1|1][rt]);
		}
	}else{
		if(p<=mid) updateY(id,rt<<1,l,mid,p,v);
		else updateY(id,rt<<1|1,mid+1,r,p,v);
		pushUpY(id,rt);
	}
}
 
void updateX(int rt,int l,int r,int p1,int p2,int v,int m)
{
	if(l==r){
		leaf=true;
		updateY(rt,1,1,m,p2,v);
	}else{
		if(p1<=mid) updateX(rt<<1,l,mid,p1,p2,v,m);
		else updateX(rt<<1|1,mid+1,r,p1,p2,v,m);
		leaf=false;
		updateY(rt,1,1,m,p2,v);
	}
}
 
void queryY(int id,int rt,int l,int r,int L,int R,int &mx,int &mn)
{
	if(L<=l&&r<=R){
		mx=max(mx,maxn[id][rt]);
		mn=min(mn,minn[id][rt]);
	}else{
		if(L<=mid) queryY(id,rt<<1,l,mid,L,R,mx,mn);
		if(R>mid) queryY(id,rt<<1|1,mid+1,r,L,R,mx,mn);
	}
}
 
void queryX(int rt,int l,int r,int L,int R,int L1,int R1,int &mx,int &mn,int m)
{
	if(L<=l&&r<=R){
		queryY(rt,1,1,m,L1,R1,mx,mn);
	}else{
		if(L<=mid) queryX(rt<<1,l,mid,L,R,L1,R1,mx,mn,m);
		if(R>mid) queryX(rt<<1|1,mid+1,r,L,R,L1,R1,mx,mn,m);
	}
}
 
int main()
{
	int n,q,a,b,c,d;
	char op[2];
	while(~scanf("%d",&n))
	{
		buildX(1,1,n,n);
		scanf("%d",&q);
		while(q--)
		{
			scanf("%s",op);
			if(op[0]=='c'){
				scanf("%d%d%d",&a,&b,&c);
				updateX(1,1,n,a,b,c,n);
			}else if(op[0]=='q'){
				scanf("%d%d%d%d",&a,&b,&c,&d);
				int ansA=-INF,ansB=INF;
				queryX(1,1,n,a,c,b,d,ansA,ansB,n);
				printf("%d %d\n",ansA,ansB);
			}
		}
	}
	return 0;
}