package hxt.ui;

import hxt.input.Input;

import h2d.Font;
import h2d.Object;
import h3d.Vector;
import hxd.res.DefaultFont;

class Menu extends Object {
  var menuItems : Array<MenuItem>;
  var selectedIndex : Int;

  public function new(
    parent: Object,
    items : Array<MenuItemData>,
    width: Int,
    ?font : Font,
    ?color : Vector,
    ?selectedColor : Vector
  ) {
    super(parent);

    selectedIndex = 0;

    var y = 0;

    menuItems = [];

    for (item in items) {
      var menuItem = new MenuItem(this, item.text, item.action, font, color, selectedColor);

      menuItem.x = width / 2 - menuItem.width / 2;
      menuItem.y = y;

      menuItems.push(menuItem);

      y += menuItem.height;
    }

    menuItems[0].select();
  }

  public function update(dt: Float) {
    for(menuItem in menuItems) {
      menuItem.update(dt);
    }

    if(Input.menu.isPressed("up")) {
      selectPreviousItem();
    } else if (Input.menu.isPressed("down")) {
      selectNextItem();
    }
  }

  function selectNextItem() {
    var index = selectedIndex + 1;

    if (index >= menuItems.length) index = 0;

    selectItem(index);
  }

  function selectPreviousItem() {
    var index = selectedIndex - 1;

    if (index < 0) index = menuItems.length - 1;

    selectItem(index);
  }

  function selectItem(index : Int) {
    var menuItem : MenuItem = menuItems[selectedIndex];

    menuItem.deselect();

    selectedIndex = index;

    menuItem = menuItems[selectedIndex];

    menuItem.select();
  }
}

typedef MenuItemData = {
  text : String,
  action : Void -> Void
}
