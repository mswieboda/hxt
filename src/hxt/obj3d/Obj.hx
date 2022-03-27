package hxt.obj3d;

import h3d.Vector;
import h3d.scene.Object;

class Obj extends Object {
  public var collider : Collider;
  public var trigger : Trigger;

  public function new(
    model : Object,
    ?colliderSize : Vector,
    ?triggerSize : Vector,
    ?parent : Object
  ) {
    super(parent);

    addChild(model);

    if (colliderSize != null)
      collider = new Collider(colliderSize, this);

    if (triggerSize != null)
      trigger = new Trigger(triggerSize, this);
  }

  public function update(dt : Float) {}

  public function collided(obj : Obj) : Bool {
    if (collider == null || obj.collider == null) return false;

    return collider.collided(obj.collider);
  }

  public function triggered(obj : Obj) : Bool {
    if (trigger == null || obj.collider == null) return false;

    return trigger.collided(obj.collider);
  }
}
