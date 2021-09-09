package hxt.obj;

import h3d.Vector;
import h3d.mat.BlendMode;
import h3d.scene.Object;

class Trigger extends Collider {
  public function new(size : Vector, ?parent : Object) {
    super(size, parent, 0x330000cc);
  }
}
