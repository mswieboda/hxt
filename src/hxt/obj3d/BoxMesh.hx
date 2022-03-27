package hxt.obj3d;

import h3d.Vector;
import h3d.scene.Mesh;
import h3d.scene.Object;

class BoxMesh extends Mesh {
  public function new(size : Vector, ?parent : Object, centered = true) {
    var cube = new h3d.prim.Cube(size.x, size.y, size.z, centered);

    cube.addNormals();
    cube.addUVs();

    super(cube, parent);
  }
}
