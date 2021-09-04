import hxt.scene.Stage;
import hxt.scene.Scene;

import hxd.App;
import hxd.Res;

class Main extends App {
  var stage : Stage;

  override function init() {
    stage = new Stage(s2d, s3d);
    stage.changeScene(new MenuScene(stage));
  }

  override function update(dt: Float) {
    stage.update(dt);
  }

  static function main() {
    Res.initEmbed();
    new Main();
  }
}
