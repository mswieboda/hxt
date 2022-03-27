package hxt.obj2d;

import h2d.col.Point;
import h2d.Object;

class Obj extends Object {
  public var collider : Collider;
  public var trigger : Trigger;

  public function new(
    sprite : Object,
    ?colliderSize : Point,
    ?triggerSize : Point,
    ?parent : Object
  ) {
    super(parent);

    addChild(sprite);

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
