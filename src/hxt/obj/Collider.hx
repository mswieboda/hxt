package hxt.obj;

import h3d.Vector;
import h3d.mat.BlendMode;
import h3d.scene.Object;

class Collider extends BoxMesh {
  public function new(size : Vector, ?parent : Object, color = 0x33cc0000) {
    super(size, parent);

    #if debug
    material.color.setColor(color);
    material.blendMode = BlendMode.Alpha;
    material.shadows = false;
    #else
    visible = false;
    #end
  }

  public static function scaleSize(model : Object, scale : Vector) : Vector {
    var bounds = model.getBounds();

    return new Vector(
      bounds.xSize + model.scaleX * scale.x,
      bounds.ySize + model.scaleY * scale.y,
      bounds.zSize + model.scaleZ * scale.z
    );
  }

  public function collided(object : Object) : Bool {
    return object.getBounds().collide(this.getBounds());
  }
}
