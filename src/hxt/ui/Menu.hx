package hxt.ui;

import hxt.input.Input;

import h2d.Font;
import h2d.Object;

class Menu extends Object {
  var menuItems : Array<MenuItem>;
  var selectedIndex : Int;

  public var width(default, null) : Float;
  public var height(default, null) : Float;

  public function new(
    parent: Object,
    items : Array<MenuItemData>,
    midX: Float,
    ?selectedColor : Int,
    ?color : Int,
    ?font : Font
  ) {
    super(parent);

    selectedIndex = 0;

    var y = 0.0;

    menuItems = [];

    for (item in items) {
      var menuItem = new MenuItem(this, item.text, item.action, selectedColor, color, font);

      menuItem.x = midX - menuItem.width / 2;
      menuItem.y = y;

      menuItems.push(menuItem);

      y += menuItem.height;
    }

    width = 0.0;
    height = 0.0;

    // sets width/height, only used for outside usage, positioning etc
    for (menuItem in menuItems) {
      if (menuItem.width > width) {
        width = menuItem.width;
      }

      height += menuItem.height;
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
