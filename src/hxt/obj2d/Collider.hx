package hxt.obj2d;

import h2d.col.Bounds;
import h2d.col.Point;
import h2d.Object;

class Collider {
  public var parent : Object;
  public var size : Point;

  public function new(size : Point, ?parent : Object, color = 0x33cc0000) {
    this.size = size;
    this.parent = parent;

    // // TODO: switch to 2d
    // #if debug
    // material.color.setColor(color);
    // material.blendMode = BlendMode.Alpha;
    // material.shadows = false;
    // #else
    // visible = false;
    // #end
  }

  // TODO: switch to 2d
  // public static function scaleSize(model : Object, scale : Vector) : Vector {
  //   var bounds = model.getBounds();

  //   return new Vector(
  //     bounds.xSize + model.scaleX * scale.x,
  //     bounds.ySize + model.scaleY * scale.y,
  //     bounds.zSize + model.scaleZ * scale.z
  //   );
  // }

  public function getBounds() : Bounds {
    return Bounds.fromValues(parent.x, parent.y, size.x, size.y);
  }

  public function collided(collider : Collider) : Bool {
    return collider.getBounds().intersects(this.getBounds());
  }
}
