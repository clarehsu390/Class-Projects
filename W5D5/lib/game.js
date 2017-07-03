const Asteroid = require('./asteroid.js');
const VALUE = {
  DIM_X: 200,
  DIM_Y: 400,
  NUM_ASTEROIDS: 10
};

class Game {
  constructor() {
    this.asteroids = [];
    this.addAsteroids();
  }


  addAsteroids(){
    for (let i = 0; i < VALUE.NUM_ASTEROIDS; i++) {
      this.asteroids.push(new Asteroid());
    }
  }

  randomePosition(){
    let x = VALUE.DIM_X * Math.random();
    let y = VALUE.DIM_Y * Math.random();
    return [x, y];
  }

  draw(ctx){
    ctx.clearRect(0, 0, VALUE.DIM_X, VALUE.DIM_Y);
    this.asteroids.forEach((asteroid) => {
      asteroid.draw(ctx);
    });
  }

  moveObjects(){
    this.asteroids.forEach((asteroid) => {
      asteroid.move();
    });
  }
}
