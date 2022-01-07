stop();
var wellDone = false;
var car = gameRoot.player;
this.onEnterFrame = function()
{
   if(car.hitTest(hitSpot))
   {
      var _loc3_ = 0;
      var _loc2_ = 1;
      while(_loc2_ <= 4)
      {
         if(car["cp" + _loc2_].hitTest(hitSpot))
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ == 4 && Math.abs(car.speed) < 0.2 && wellDone == false)
      {
         delete this.onEnterFrame;
         hitSpot.gotoAndPlay("done");
         playVoice("mission42");
      }
   }
};
