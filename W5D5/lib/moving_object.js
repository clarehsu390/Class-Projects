class MovingObject {
  constructor(options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
  }

  draw() {
    let canvas = document.getElementById('canvas');

    let ctx = canvas.getContext('2d');
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    ctx.fill();
  }

  move() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
  }
}

const circle = new MovingObject( { pos: [30, 30], vel: [10, 10], radius: 20, color: "#00FF00"});
circle.draw();
circle.move();

// const Circle =  function (centerX, centerY, radius, color) {
//   this.centerX = centerX;
//   this.centerY = centerY;
//   this.radius = radius;
//   this.color = color;
// };
