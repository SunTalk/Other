// Box2D Particle System
// <http://www.shiffman.net/teaching/nature>
// Spring 2010

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem  {

  ArrayList<LParticle> Lparticles;    // An ArrayList for all the particles
  Vec2 origin;         // An origin point for where particles are birthed

  ParticleSystem(int num, Vec2 v) {
    Lparticles = new ArrayList<LParticle>();             // Initialize the ArrayList
    origin = v;                        // Store the origin point

      for (int i = 0; i < num; i++) {
      Lparticles.add(new LParticle(origin.x,origin.y));    // Add "num" amount of particles to the ArrayList
    }
  }

  void run() {
    // Display all the particles
    for (LParticle p: Lparticles) {
      p.display();
    }
    
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    for (int i = Lparticles.size()-1; i >= 0; i--) {
      LParticle p = Lparticles.get(i);
      if (p.done()) {
        Lparticles.remove(i);
      }
    }
  }
  void killBody()
  {
    for (int i = Lparticles.size()-1; i >= 0; i--) {
      LParticle p = Lparticles.get(i);
      p.done2();
      Lparticles.remove(i);
    }
  }
  void addParticles(int n) {
    for (int i = 0; i < n; i++) {
      Lparticles.add(new LParticle(origin.x,origin.y));
    }
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (Lparticles.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }

}