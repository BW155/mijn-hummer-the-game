function rotateTo()
{
   var _loc3_ = _parent.player._x - arrowTarget.x;
   var _loc2_ = _parent.player._y - arrowTarget.y;
   var _loc4_ = (- Math.atan2(_loc3_,_loc2_)) / 0.017453292519943295;
   var _loc5_ = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
   if(_loc5_ < 400)
   {
      if(myArrow._visible == true)
      {
         myArrow._visible = false;
         gameRoot.kompas.signal.gotoAndPlay("green");
      }
   }
   else
   {
      if(myArrow._visible == false)
      {
         myArrow._visible = true;
         gameRoot.kompas.signal.gotoAndPlay("green");
      }
      myArrow._rotation = _loc4_;
   }
}
