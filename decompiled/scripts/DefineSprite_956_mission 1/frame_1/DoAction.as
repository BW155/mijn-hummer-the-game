stop();
var wellDone = false;
var car = _parent._parent._parent._parent._parent.player;
this.onEnterFrame = function()
{
   if(car.hitTest(hitSpot))
   {
      var _loc2_ = 0;
      var _loc1_ = 1;
      while(_loc1_ <= 4)
      {
         if(car["cp" + _loc1_].hitTest(hitSpot))
         {
            _loc2_ = _loc2_ + 1;
         }
         _loc1_ = _loc1_ + 1;
      }
      if(_loc2_ == 4 && Math.abs(car.speed) < 0.2 && wellDone == false)
      {
         wellDone = true;
         hitSpot.gotoAndPlay("done");
      }
   }
};
