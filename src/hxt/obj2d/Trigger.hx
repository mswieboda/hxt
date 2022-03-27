package hxt.obj2d;

import h2d.col.Point;
import h2d.Object;

class Trigger extends Collider {
  public function new(size : Point, ?parent : Object) {
    super(size, parent, 0x330000cc);
  }
}
