function initMission3()
{
   civCount = 11;
   i = 1;
   while(i <= civCount)
   {
      this["civ" + i].hit = false;
      i++;
   }
   i = 1;
   while(i <= civCount)
   {
      civCrowd(i);
      i++;
   }
}
function civCrowd(nr)
{
   myCiv = this["civ" + nr];
   myCiv.theColor = random(7) + 1;
   myCiv.civClip.gotoAndStop(random(3) + 1);
   myCiv.clock = random(100) + 10;
   myCiv.onEnterFrame = function()
   {
      this.deltaX = this._x + _parent._parent._x - car._x;
      this.deltaY = this._y + _parent._parent._y - car._y;
      this.targetRotation = (- Math.atan2(this.deltaX,this.deltaY)) / 0.017453292519943295;
      this.civClip._rotation = this.targetRotation;
      if(this.clock > 0)
      {
         this.clock = this.clock - 1;
      }
      else if(this.clock <= 0)
      {
         this.clock = random(100) + 10;
         this.civClip.gotoAndStop(random(3) + 1);
      }
      if(this.hit == false && this.civClip.hitTest(car))
      {
         this.hit = true;
         this.gotoAndStop(6);
         delete this.onEnterFrame;
         this.civClip._rotation = car._rotation;
      }
   };
}
stop();
var killCount = 0;
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
      if(_loc3_ == 4 && Math.abs(car.speed) < 0.2 && wellDone == false && car._rotation > -45 && car._rotation < 45)
      {
         delete this.onEnterFrame;
         gameRoot.gamePauze = true;
         wellDone = true;
         hitSpot.gotoAndPlay("done");
         car.speed = 0;
      }
   }
};
initMission3();
