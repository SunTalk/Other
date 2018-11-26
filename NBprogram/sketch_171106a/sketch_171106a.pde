ball balls;
ball ball2;
int ch=0;
int temp=0;
float nextx=random(10,1100);
float nexty=random(470,530);
float spring = 0.5;
// The ground is an array of "Ground" objects
int segments = 40;
Ground[] ground = new Ground[segments];
Ground[] ground2 = new Ground[segments];
Ground[] ground3 = new Ground[segments];
Ground[] ground4 = new Ground[segments];
void setup(){
	size(1200,800);
	balls=new ball(new PVector(width*0.5, height*0.5),20);
	ball2=new ball(new PVector(width*0.5, height*0.5),20);
	ball2.r=0;
	ball2.textposy=40;
	//ch1
	float[] peakHeights = new float[segments+1];
	for (int i=0; i<peakHeights.length; i++){
		peakHeights[i] = random(0,150);
	}
	float segs = segments;
	for (int i=0; i<segments; i++){
		ground[i]  = new Ground(width/segs*i, peakHeights[i], width/segs*(i+1), peakHeights[i+1]);
	}
	
	
	//ch2
	float[] peakHeights2 = new float[segments+1];
	for (int i=0; i<peakHeights2.length; i++){
		peakHeights2[i] = random( height-150,height);
	}
	for (int i=0; i<segments; i++){
		ground2[i]  = new Ground(width/segs*i, peakHeights2[i], width/segs*(i+1), peakHeights2[i+1]);
	}
	//ch3
	float[] peakHeights3 = new float[(segments+1)];
	for (int i=0; i<peakHeights3.length; i++){
		peakHeights3[i] = random( height-200,height);
	}
	for (int i=0; i<segments; i++){
		ground3[i]  = new Ground(width/segs*i, peakHeights3[i], width/segs*(i+1), peakHeights3[i+1]);
	}
	float[] peakHeights4= new float[segments+1];
	for (int i=0; i<peakHeights4.length; i++){
		peakHeights4[i] = random( 0,350);
	}
	for (int i=0; i<segments; i++){
		ground4[i]  = new Ground(width/segs*i, peakHeights4[i], width/segs*(i+1), peakHeights4[i+1]);
	}
	
}
void draw()
{
	background(0);
	 run();
	if(ch==0)
	{
		fill(255);
		beginShape();
		for (int i=0; i<segments; i++){
		vertex(ground[i].x1, ground[i].y1);
		vertex(ground[i].x2, ground[i].y2);
		}
			vertex(ground[segments-1].x2, 0);
			vertex(ground[0].x1, 0);
			endShape();
			for (int i=0; i<segments; i++){
			balls.checkGroundCollisionT(ground[i]);
			ball2.checkGroundCollisionT(ground[i]);
		}
		ellipse(1100,700,10,10);
		if(dist(balls.pos.x,balls.pos.y,1100,700)<15 || dist(ball2.pos.x,ball2.pos.y,1100,700)<15) 
		{
			ch=1;
		}
	}
	if(ch==1)
	{
		fill(255);
		beginShape();
		for (int i=0; i<segments; i++){
		vertex(ground2[i].x1, ground2[i].y1);
		vertex(ground2[i].x2, ground2[i].y2);
		}
			vertex(ground2[segments-1].x2, height);
			vertex(ground2[0].x1, height);
			endShape(CLOSE);
			for (int i=0; i<segments; i++){
			balls.checkGroundCollisionD(ground2[i]);
			ball2.checkGroundCollisionD(ground2[i]);
		}
		ellipse(1000,200,10,10);
		if(dist(balls.pos.x,balls.pos.y,1000,200)<15 || dist(ball2.pos.x,ball2.pos.y,1000,200)<15) 
		{
			if(dist(balls.pos.x,balls.pos.y,1000,200)<15) balls.score++;
			if(dist(ball2.pos.x,ball2.pos.y,1000,200)<15) ball2.score++;
			ch=2;
		}
	}
	if(ch==2)
	{
		fill(255);
		ellipse(1100,550,10,10);
		beginShape();
		for (int i=0; i<segments; i++){
		vertex(ground3[i].x1, ground3[i].y1);
		vertex(ground3[i].x2, ground3[i].y2);
		}
			vertex(ground3[segments-1].x2, height);
			vertex(ground3[0].x1, height);
			endShape(CLOSE);
			for (int i=0; i<segments; i++){
			balls.checkGroundCollisionD(ground3[i]);
			ball2.checkGroundCollisionD(ground3[i]);
		}
		beginShape();
		for (int i=0; i<segments; i++){
		vertex(ground4[i].x1, ground4[i].y1);
		vertex(ground4[i].x2, ground4[i].y2);
		}
			vertex(ground4[segments-1].x2, 0);
			vertex(ground4[0].x1, 0);
			endShape();
			for (int i=0; i<segments; i++){
			balls.checkGroundCollisionT(ground4[i]);
			ball2.checkGroundCollisionT(ground4[i]);
		}
		if(dist(balls.pos.x,balls.pos.y,1100,550)<15 || dist(ball2.pos.x,ball2.pos.y,1100,550)<15)
		{
			if(dist(balls.pos.x,balls.pos.y,1100,550)<15) balls.score++;
			if(dist(ball2.pos.x,ball2.pos.y,1100,550)<15) ball2.score++;
			temp=ch+1;
		}
	}
	if(temp>ch){
		creat();
		nextx=random(10,1100);
		nexty=random(470,530);
		ch++;
	}
	if(ch>2 && ch<50)
	{
		fill(255);
		ellipse(nextx,nexty,10,10);
		beginShape();
		for (int i=0; i<segments; i++){
		vertex(ground3[i].x1, ground3[i].y1);
		vertex(ground3[i].x2, ground3[i].y2);
		}
			vertex(ground3[segments-1].x2, height);
			vertex(ground3[0].x1, height);
			endShape(CLOSE);
			for (int i=0; i<segments; i++){
			balls.checkGroundCollisionD(ground3[i]);
			ball2.checkGroundCollisionD(ground3[i]);
		}
		beginShape();
		for (int i=0; i<segments; i++){
		vertex(ground4[i].x1, ground4[i].y1);
		vertex(ground4[i].x2, ground4[i].y2);
		}
			vertex(ground4[segments-1].x2, 0);
			vertex(ground4[0].x1, 0);
			endShape();
			for (int i=0; i<segments; i++){
			balls.checkGroundCollisionT(ground4[i]);
			ball2.checkGroundCollisionT(ground4[i]);
		}
		if(dist(balls.pos.x,balls.pos.y,nextx,nexty)<15 || dist(ball2.pos.x,ball2.pos.y,nextx,nexty)<15) 
		{
			if(dist(balls.pos.x,balls.pos.y,nextx,nexty)<15) balls.score++;
			if(dist(ball2.pos.x,ball2.pos.y,nextx,nexty)<15) ball2.score++;
			temp++;
		}
	}
	
	balls.displayscore();
	ball2.displayscore();
	if(balls.score>10 ||ball2.score>10)
	{
		ch+=50;
		if(balls.score>10) 
		{
			fill(balls.r,balls.g,balls.b);
			textSize(100);
			text("p1 win",450,400);
		}
		if(ball2.score>10) 
		{
			fill(ball2.r,ball2.g,ball2.b);
			textSize(100);
			text("p2 win",450,400);
		}
		
		
		
	}
	
	
	
}

void run()
{
	balls.display(); 
	balls.ballcolli(ball2);
	if(balls.hit==true) balls.hit(ball2);
	balls.move();
	ball2.display();
	ball2.ballcolli(balls);
	if(ball2.hit==true) ball2.hit(balls);
	
	ball2.move();
}
void creat()
{
	float segs = segments;
	float[] peakHeights3 = new float[(segments+1)];
	for (int i=0; i<peakHeights3.length; i++){
		peakHeights3[i] = random( height-250,height);
	}
	for (int i=0; i<segments; i++){
		ground3[i]  = new Ground(width/segs*i, peakHeights3[i], width/segs*(i+1), peakHeights3[i+1]);
	}
	float[] peakHeights4= new float[segments+1];
	for (int i=0; i<peakHeights4.length; i++){
		peakHeights4[i] = random( 0,450);
	}
	for (int i=0; i<segments; i++){
		ground4[i]  = new Ground(width/segs*i, peakHeights4[i], width/segs*(i+1), peakHeights4[i+1]);
	}
}
void keyReleased(){

	if(keyCode==UP) balls.fly=false;
	if(keyCode==LEFT) balls.left=false;
	if(keyCode==RIGHT) balls.right=false;
	if(keyCode==DOWN) balls.hit=false;
	if(key=='w') ball2.fly=false;
	if(key=='a') ball2.left=false;
	if(key=='d') ball2.right=false;
	if(key=='s') ball2.hit=false;

}

void keyPressed(){
	
	if(keyPressed && keyCode==UP) balls.fly=true;
	if(keyPressed && keyCode==LEFT) balls.left=true;
	if(keyPressed && keyCode==RIGHT) balls.right=true;
	if(keyPressed && keyCode==DOWN) balls.hit=true;
	if(keyPressed && key=='w') ball2.fly=true;
	if(keyPressed && key=='a') ball2.left=true;
	if(keyPressed && key=='d') ball2.right=true;
	if(keyPressed && key=='s') ball2.hit=true;

}

class ball{
	float see=200;
	PVector pos;
	PVector mov = new PVector(0,0);
	PVector acc = new PVector(0, 0);
	float radius;
	ArrayList<ball> ballL;
	boolean hasChildren = false;
	boolean left=false;
	boolean right=false;
	boolean fly=false;
	boolean hit=false;
	int r=255;
	int g=100;
	int b=100;
	int score=0;
	int textposy=20;
	
	ball(PVector _pos,float r){
		pos=_pos;
		radius=r;
		ballL = new ArrayList<ball>();
	}
	ball(PVector _pos,float r,float _see,boolean _left,boolean _right,boolean _fly){
		pos=_pos;
		radius=r;
		see=_see;
		ballL = new ArrayList<ball>();
		left=_left;
		right=_right;
		fly=_fly;
	}
	
	void display()
	{
		if(!hasChildren){
			ellipseMode(RADIUS);
			noStroke();
			fill(r,g,b,200);
			ellipse(pos.x,pos.y,radius,radius);
		}
		else//recursive
		{
			for(ball c : ballL)
			{
				c.display();
			}
		}
	}
	void move()
	{
		if (!hasChildren) {
			mov.add(acc);
			pos.add(mov);
			acc.mult(0);
			this.collision(); 
			
			if (fly==true) {
				this.accspd(0,-0.3);
			}
			else{
				if(pos.y<800)
				this.accspd(0,0.2);
			}
			if (left==true) {
				this.accspd(-0.5,0);
			}
			else {
				if(mov.x<0)
				this.accspd(0.5,0);
			}
			if (right==true) {
				this.accspd(0.5,0);
			}
			 else {
				if(mov.x>0)
				this.accspd(-0.5,0);
			}
			
		}
		else {
			for (ball c : ballL) {
				c.move();
			}
		}
	}
	void hit(ball a)
	{
		float ro=atan2(a.pos.y-pos.y,a.pos.x-pos.x);
		this.accspd(1*cos(ro),1*sin(ro));
	}
	void accspd(float a,float b)
	{
		if (!hasChildren) {
			acc.add(a,b);
		} else {
			for (ball c : ballL) {
				c.accspd(a,b);
			}
		}
	}
	void collision() {
		if (pos.x - radius < 0) {
			pos.x = radius;
			mov.x*=-0.5;
		}
 
		if (pos.x + radius > width) {
			pos.x = width-radius;
			mov.x*=-0.5;
		}
 
		if (pos.y-radius < 0) {
			pos.y = radius;
			mov.y=0;
		}
 
		if (pos.y + radius > height) {
			pos.y = height-radius;
			mov.y*=-0.5;
		}
	 }
	 void mitosis() {
		//Create two children, half the size of the actual, and instead of
		//displaying the actual cell, display the children, ect
		ballL.add(new ball(pos, radius*0.8, see-1,left,right,fly));
		//cellL.add(new Cell(pos, radius*0.8, random(360)));
		ballL.get(0).accspd(0, 0);
		ballL.add(new ball(pos, radius*0.8, see-1,left,right,fly));
		//cellL.add(new Cell(pos, radius*0.8, random(360)));
		ballL.get(1).accspd(-10, -10);
		hasChildren = true;
	 }
	 void checkGroundCollisionT(Ground groundSegment) {
		// Get difference between orb and ground
		float deltaX = pos.x - groundSegment.x;
		float deltaY = pos.y-groundSegment.y;

		// Precalculate trig values
		float cosine = cos(groundSegment.rot);
		float sine = sin(groundSegment.rot);

		/* Rotate ground and velocity to allow 
		 orthogonal collision calculations */
		float groundXTemp = cosine * deltaX + sine * deltaY;
		float groundYTemp = cosine * deltaY - sine * deltaX;
		float velocityXTemp = cosine * mov.x + sine * mov.y;
		float velocityYTemp = cosine * mov.y - sine * mov.x;

		/* Ground collision - check for surface 
		 collision and also that orb is within 
		 left/rights bounds of ground segment */
		if (-groundYTemp > -radius+15 &&
			pos.x > groundSegment.x1 &&
			pos.x < groundSegment.x2 ) {
			// keep orb from going into ground
			groundYTemp = radius;
			// bounce and slow down orb
			velocityYTemp *= -1.0;
			velocityYTemp *= 1;
		}

		// Reset ground, velocity and orb
		deltaX = cosine * groundXTemp - sine * groundYTemp;
		deltaY = cosine * groundYTemp + sine * groundXTemp;
		mov.x = (cosine * velocityXTemp - sine * velocityYTemp)*1;
		mov.y = (cosine * velocityYTemp + sine * velocityXTemp)*1;
		pos.x = groundSegment.x + deltaX;
		pos.y = groundSegment.y + deltaY;
	
	
	}
	void checkGroundCollisionD(Ground groundSegment) {
		// Get difference between orb and ground
		float deltaX = pos.x - groundSegment.x;
		float deltaY = pos.y-groundSegment.y;

		// Precalculate trig values
		float cosine = cos(groundSegment.rot);
		float sine = sin(groundSegment.rot);

		/* Rotate ground and velocity to allow 
		 orthogonal collision calculations */
		float groundXTemp = cosine * deltaX + sine * deltaY;
		float groundYTemp = cosine * deltaY - sine * deltaX;
		float velocityXTemp = cosine * mov.x + sine * mov.y;
		float velocityYTemp = cosine * mov.y - sine * mov.x;

		/* Ground collision - check for surface 
		 collision and also that orb is within 
		 left/rights bounds of ground segment */
		if (groundYTemp > -radius+15 &&
			pos.x > groundSegment.x1 &&
			pos.x < groundSegment.x2 ) {
			// keep orb from going into ground
			groundYTemp = -radius;
			// bounce and slow down orb
			velocityYTemp *= -1.0;
			velocityYTemp *= 1;
		}

		// Reset ground, velocity and orb
		deltaX = cosine * groundXTemp - sine * groundYTemp;
		deltaY = cosine * groundYTemp + sine * groundXTemp;
		mov.x = (cosine * velocityXTemp - sine * velocityYTemp)*1;
		mov.y = (cosine * velocityYTemp + sine * velocityXTemp)*1;
		pos.x = groundSegment.x + deltaX;
		pos.y = groundSegment.y + deltaY;
	
	
	}
	void ballcolli(ball a)
	{
		 if(dist(a.pos.x,a.pos.y,this.pos.x,this.pos.y)<2*radius)
		 {
			 float angle = atan2(a.pos.y-pos.y,a.pos.x-pos.x );
				float targetX = pos.x + cos(angle) * 2*radius;
				float targetY = pos.y + sin(angle) * 2*radius;
				float ax = (targetX - a.pos.x) * spring;
				float ay = (targetY - a.pos.y) * spring;
				mov.x -= ax;
				mov.y -= ay;
				a.mov.x+= ax;
				a.mov.y+= ay;
			 
		 }
		 
		 
	}
	void displayscore()
	{
		fill(r,g,b);
		textSize(20);
		text("score:"+score,20,textposy);
	}
	
}

class Ground {
	float x1, y1, x2, y2;  
	float x, y, len, rot;

	// Constructor
	Ground(float x1, float y1, float x2, float y2) {
		this.x1 = x1;
		this.y1 = y1;
		this.x2 = x2;
		this.y2 = y2;
		x = (x1+x2)/2;
		y = (y1+y2)/2;
		len = dist(x1, y1, x2, y2);
		rot = atan2((y2-y1), (x2-x1));
	}
}