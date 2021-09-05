package hxt.input;

import hxd.Pad;

class Input {
  public static inline var game = GameInput;
  public static inline var menu = MenuInput;

  public static var pad(get, never) : Pad;

  public static function init() {
    GamePad.init();
  }

  static function get_pad() : Pad {
    return GamePad.pad;
  }
}

// example of how to use above Input class:
// package yourgame.input;

// class Input {
//   public static inline var game = yourgame.input.GameInput;
//   public static inline var menu = yourgame.input.MenuInput;

//   public static function init() {
//     hxt.input.Input.init();
//   }
// }
