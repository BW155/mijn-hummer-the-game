stop();
var wellDone = false;
var car = gameRoot.player;
this.onEnterFrame = function()
{
   if(car.hitTest(hit) && han._currentframe == 1)
   {
      han.gotoAndPlay("dead");
   }
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
         gameRoot.gamePauze = true;
         wellDone = true;
         hitSpot.gotoAndPlay("done");
         car.speed = 0;
      }
   }
};
