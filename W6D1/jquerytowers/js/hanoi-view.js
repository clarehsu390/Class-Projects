class View{
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.clicker = 0;
    this.setupTowers();


  }

  setupTowers() {
    let $tower, $disk;
    for (var tower = 0; tower < 3; tower++){
       $tower = $("<ul>");
       $tower.addClass("tower");
       $tower.data("num", tower);
      for(var disk = 0; disk < 3 ; disk ++){
        $disk = $("<li>");
        $disk.addClass("disk");
        $tower.append($disk);
      }
      this.$el.append($tower);
    }
  }
  render() {
    this.game.run();

  }
  clickTower(event) {
    $(".tower").on("click", (e => {
      let $tower = $(e.currentTarget);
      this.clicker++;
      if (this.clicker ===1){
        this.fromTower = $tower;}
      else{
        this.toTower =$tower;
        this.clicker = 0;
      }
    }));
  }
}



module.exports = View;
