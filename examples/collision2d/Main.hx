import hxt.input.Input;
import hxt.scene.Stage;
import hxt.scene.Scene;

import h2d.Graphics;
import h2d.Tile;
import h2d.Bitmap;
import hxd.App;
import hxd.Res;
import hxd.System;

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
  public static inline var SPEED = 100;

  var other : Bitmap;
  var player : Bitmap;
  var collision : Graphics;

  public function new(stage : Stage) {
    super(stage);

    var tile = Tile.fromColor(0x0000FF, 100, 100);
    other = new Bitmap(tile, s2d);

    other.x = 100;
    other.y = 100;

    tile = Tile.fromColor(0xFF0000, 100, 100);
    player = new Bitmap(tile, s2d);
    player.x = 300;
    player.y = 300;

    collision = new Graphics(s2d);
  }

  public override function update(dt : Float) {
    movement(dt);
    checkCollision();

    if (Input.menu.isPressed("exit")) {
      System.exit();
    }
  }

  function movement(dt : Float) {
    if (Input.game.isDown("moveLeft")) {
      player.x -= dt * SPEED;
    } else if (Input.game.isDown("moveRight")) {
      player.x += dt * SPEED;
    }

    if (Input.game.isDown("moveForward")) {
      player.y -= dt * SPEED;
    } else if (Input.game.isDown("moveBackward")) {
      player.y += dt * SPEED;
    }
  }

  function checkCollision() {
    collision.clear();

    var intersection = player.getBounds().intersection(other.getBounds());

    if (intersection.width > 0 && intersection.height > 0) {
      collision.beginFill(0xFF00FF);
      collision.drawRect(intersection.xMin, intersection.yMin, intersection.width, intersection.height);
      collision.endFill();
    }
  }
}
