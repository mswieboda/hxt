import hxt.input.Input;
import hxt.scene.Stage;
import hxt.scene.Scene;

import h2d.Anim;
import h2d.Text;
import h2d.Tile;
import hxd.App;
import hxd.Res;
import hxd.System;
import hxd.res.DefaultFont;

class Main extends App {
  var stage : Stage;

  override function init() {
    stage = new Stage(s2d, s3d);
    stage.changeScene(new MainScene(stage));
  }

  override function update(dt: Float) {
    stage.update(dt);
  }

  static function main() {
    Res.initEmbed();
    new Main();
  }
}

class MainScene extends Scene {
  var animation : Anim;
  var text : Text;

  public function new(stage : Stage) {
    super(stage);

    var size = 100;
    var tiles = [
      Tile.fromColor(0xFF0000, size, size),
      Tile.fromColor(0xFFFF00, size, size),
      Tile.fromColor(0x00FF00, size, size),
      Tile.fromColor(0x00FFFF, size, size),
      Tile.fromColor(0x0000FF, size, size),
      Tile.fromColor(0xFF00FF, size, size)
    ];
    animation = new Anim(tiles, 5, s2d);
    animation.x = s2d.width * 0.5 - size * 0.5;
    animation.y = s2d.height * 0.5 - size * 0.5;

    text = new Text(DefaultFont.get(), s2d);
  }

  public override function update(dt : Float) {
    if (Input.menu.isDown("up")) {
      if (animation.speed * (1 + dt) < 100) {
        animation.speed *= 1 + dt;
      }
    } else if (Input.menu.isDown("down")) {
      if (animation.speed / (1 + dt) > 0.1) {
        animation.speed /= 1 + dt;
      }
    }

    text.text = 'animation FPS: ${animation.speed}';

    if (Input.menu.isPressed("exit")) {
      System.exit();
    }
  }
}
