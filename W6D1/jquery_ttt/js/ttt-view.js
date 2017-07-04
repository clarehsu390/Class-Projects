class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $(".square").on("click",(e => {
      let $square = $(e.currentTarget);
      this.makeMove($square);

    }));
  }

  makeMove($square) {
    let currentPlayer = this.game.currentPlayer;
    let pos = ($square).data("pos");
    this.game.playMove(pos);
    if (currentPlayer === 'x') {
      $square.addClass("X");
    }
    else {
      $square.addClass("O");
    }


    if (this.game.isOver()){
      $(".square").off("click");
      let winner = this.game.winner();
      if( winner ){
        alert(`${winner} has won!`);
      }else{
        alert("It's a draw");
      }
    }
  }

  setupBoard() {
    const $ul = $("<ul>");
    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        let $li = $("<li>");
        $li.data("pos", [rowIdx, colIdx]);
        $li.addClass("square");
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }
}

module.exports = View;
