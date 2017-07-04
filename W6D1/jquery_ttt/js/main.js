const View = require('./ttt-view');// require appropriate file
const Game = require("../solution/game");// require appropriate file

$( () => {
  const $el = $('.ttt');
  const game = new Game();
  new View(game, $el);
});

console.log("hi");
