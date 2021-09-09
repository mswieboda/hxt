package hxt.obj;

import h3d.Vector;
import h3d.mat.BlendMode;
import h3d.scene.Object;

class Collider extends BoxMesh {
  public function new(model : Object, size : Vector, ?parent : Object, sizeScale = true) {
    if (sizeScale) {
      var bounds = model.getBounds();
      size = new Vector(
        bounds.xSize + model.scaleX * size.x,
        bounds.ySize + model.scaleY * size.y,
        bounds.zSize + model.scaleZ * size.z
      );
    }

    super(size, parent);

    #if debug
    material.color.setColor(0x33cc0000);
    material.blendMode = BlendMode.Alpha;
    material.shadows = false;
    #else
    visible = false;
    #end
  }

  public function collided(object : Object) : Bool {
    return object.getBounds().collide(this.getBounds());
  }
}
