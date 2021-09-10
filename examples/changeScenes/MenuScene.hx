import hxt.input.Input;
import hxt.scene.Stage;
import hxt.scene.Scene;
import hxt.ui.Menu;

import h3d.Vector;
import hxd.System;

class MenuScene extends Scene {
  var menu : Menu;

  public function new(stage : Stage) {
    super(stage);

    var menuItemData = [{
      text: "start",
      action: () -> stage.changeScene(new GameScene(stage))
    },
    {
      text: "exit",
      action: () -> System.exit()
    }];

    menu = new Menu(s2d, menuItemData, s2d.width / 2, 0x00FF00);
    menu.y = s2d.height / 3;
  }

  public override function update(dt : Float) {
    menu.update(dt);

    if (Input.menu.isPressed("exit")) {
      System.exit();
    }
  }
}
