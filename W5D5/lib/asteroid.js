const MovingObject = require('./moving_object.js');
const Game = require('./game.js');
const Util = require('./utl.js');

const DEFAULTS = {
  COLOR: 'pink',
  RADIUS: 25,
  SPEED: 4
};

class Asteroid extends MovingObject {
  constructor(options) {
    options.color = DEFAULTS.COLOR;
    options.radius = DEFAULTS.RADIUS;
    options.pos = options.pos || Game.randomePosition();
    options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);
    super(options);

  }

}
