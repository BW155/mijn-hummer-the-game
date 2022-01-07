stop();
var wellDone = false;
var car = gameRoot.player;
this.onEnterFrame = function()
{
   if(car.hitTest(hit) && han._currentframe == 1)
   {
      playSound("screem10");
      play();
      gameRoot.gamePauze = true;
      wellDone = true;
      hitSpot.gotoAndPlay("done");
   }
   if(wellDone)
   {
      car.speed = car.speed / 1.2;
   }
};
