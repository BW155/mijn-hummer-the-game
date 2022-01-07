stop();
wellDone = false;
car = gameRoot.player;
this.onEnterFrame = function()
{
   var _loc3_ = 1;
   while(_loc3_ <= 4)
   {
      hit = this["hit" + _loc3_];
      gr = this["gr" + _loc3_];
      gr.deltaX = gr._x - (car._x - _parent._parent._x);
      gr.deltaY = gr._y - (car._y - _parent._parent._y);
      gr.targetRotation = (- Math.atan2(gr.deltaX,gr.deltaY)) / 0.017453292519943295;
      gr._rotation = gr.targetRotation + 90;
      if(wellDone)
      {
         gr._x = gr._x - Math.sin(0.017453292519943295 * gr._rotation + 90) * 1;
         gr._y = gr._y + Math.cos(0.017453292519943295 * gr._rotation + 90) * 1;
      }
      if(car.hitTest(hit) && gr._currentframe == 1)
      {
         gr._rotation = car._rotation;
         gr.gotoAndPlay("dead");
         delete this.onEnterFrame;
      }
      _loc3_ = _loc3_ + 1;
   }
   if(car.hitTest(hitSpot))
   {
      var _loc4_ = 0;
      _loc3_ = 1;
      while(_loc3_ <= 4)
      {
         if(car["cp" + _loc3_].hitTest(hitSpot))
         {
            _loc4_ = _loc4_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc4_ == 4 && Math.abs(car.speed) < 0.2 && wellDone == false)
      {
         gameRoot.gamePauze = true;
         wellDone = true;
         hitSpot.gotoAndPlay("done");
         car.speed = 0;
      }
   }
};
