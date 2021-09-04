import hxt.input.Input;
import hxt.scene.Stage;
import hxt.scene.Scene;

import h2d.Bitmap;
import h2d.Graphics;
import h2d.Text;
import h2d.Tile;
import hxd.res.DefaultFont;

class GameScene extends Scene {
  public static inline var ROTATION_SPEED = 3;
  public static inline var SCALE_SPEED = 1.666;

  var scalingUp = true;
  var box : Bitmap;

  public function new(stage : Stage) {
    super(stage);

    var size = 50;

    // tile size by size, with it's x, y centered so it can rotate from it's center origin
    var tile = Tile.fromColor(0xFF0000, size, size).sub(0, 0, size, size, -size * 0.5, -size * 0.5);

    box = new Bitmap(tile, s2d);

    box.x = s2d.width * 0.5;
    box.y = s2d.height * 0.666;

    new Graphics(box);

    var text = new Text(DefaultFont.get(), s2d);
    text.text = "press ESC to go back to menu!";
    text.x = (s2d.width - text.textWidth) * 0.5;
    text.y = s2d.height * 0.333 - text.textHeight * 0.5;
  }

  public override function update(dt: Float) {
    box.rotation += dt * ROTATION_SPEED;

    // scale up, then scale down, repeat
    if (scalingUp) {
      if (box.scaleX <= 1.5) {
        box.scale(1 + dt * SCALE_SPEED);
      } else {
        scalingUp = false;
      }
    } else if (!scalingUp) {
      if (box.scaleX > 0.5) {
        box.scale(1 - dt * SCALE_SPEED);
      } else {
        scalingUp = true;
      }
    }

    if (Input.menu.isPressed("exit")) {
      stage.changeScene(new MenuScene(stage));
    }
  }
}
