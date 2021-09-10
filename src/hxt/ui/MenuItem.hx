package hxt.ui;

import hxt.input.Input;

import h2d.Text;
import h2d.Object;
import h3d.Vector;
import h2d.Font;
import hxd.res.DefaultFont;

class MenuItem extends Object {
  var text : Text;
  var selected : Bool = false;
  var action : Void -> Void;
  var color : Vector;
  var selectedColor : Vector;

  public var width(get, never) : Int;
  public var height(get, never) : Int;

  public function new(
    parent: Object,
    text : String,
    action : Void -> Void,
    ?font : Font,
    ?color : Vector,
    ?selectedColor : Vector
  ) {
    super(parent);

    this.color = color == null ? new Vector(1, 1, 1) : color;
    this.selectedColor = selectedColor == null ? new Vector(1, 0, 0) : selectedColor;

    this.text = new Text(font == null ? DefaultFont.get() : font, this);
    this.text.text = text;
    this.action = action;

    setColor();
  }

  function get_width() {
    return Std.int(text.textWidth);
  }

  function get_height() {
    return Std.int(text.textHeight);
  }

  public function update(dt: Float) {
    if (selected && Input.menu.isPressed("select")) {
      action();
    }
  }

  public function deselect() {
    selected = false;
    setColor();
  }

  public function select() {
    selected = true;
    setColor();
  }

  function setColor() {
    text.color = selected ? selectedColor : color;
  }
}
