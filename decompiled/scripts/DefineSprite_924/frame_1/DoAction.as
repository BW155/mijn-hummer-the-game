function initMission3()
{
   myHummer = gameRoot.player;
   hitCircle1.hit = false;
   hitCircle2.hit = false;
   hitCircle3.hit = false;
   hitCircle4.hit = false;
   hitCircle5.hit = false;
   civCount = 11;
   hitCircleTotal = 5;
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
   i = 1;
   while(i <= hitCircleTotal)
   {
      hitCircles(i);
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
      this.deltaX = this._x + _parent._parent._parent._x - myHummer._x;
      this.deltaY = this._y + _parent._parent._parent._y - myHummer._y;
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
      if(this.hit == false && this.civClip.hitTest(myHummer))
      {
         this.hit = true;
         this.gotoAndStop(6);
         delete this.onEnterFrame;
         this.civClip._rotation = myHummer._rotation;
      }
   };
}
function hitCircles(nr)
{
   myHitCircle = this["hitCircle" + nr];
   myHitCircle.onEnterFrame = function()
   {
      if(this.hit == false && myHummer.hitTest(this.hitObj))
      {
         this.hit = true;
         this.hitCircleAni.gotoAndPlay("end");
         hitCircleTotal--;
         if(hitCircleTotal < 1)
         {
            gameRoot.kompas.signal.gotoAndPlay("green");
            gameRoot.submission = 2;
            gameRoot.kompas.arrowTarget = {x:3300,y:2100};
         }
      }
      if(this.hitCircleAni._currentframe == 85)
      {
         delete this.onEnterFrame;
      }
   };
}
var killCount = 0;
initMission3();
