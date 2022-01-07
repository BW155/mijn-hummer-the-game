function init()
{
   soundSwitch = true;
   score = 0;
   bonusScore = 0;
   voices = true;
   secret = false;
   player = world.carLayer.car1;
   player.robot = false;
   player.driving = true;
   gameOver = false;
   fadeClip.gotoAndStop("intro");
   playGame();
}
function playGame()
{
   this.onEnterFrame = function()
   {
      if(gamePauze == false)
      {
         controls(player);
         kompas.rotateTo();
         bonusPoints();
      }
      myWorld.moveWorld(player);
      my3d.renderObj();
   };
}
function bonusPoints()
{
   if(bonusWaitCount++ > 41 && meters.bonusClip.points > 0)
   {
      bonusWaitCount = 0;
      meters.bonusClip.points = meters.bonusClip.points - 1;
      meters.bonusClip.bonus = meters.bonusClip.points;
   }
}
stop();
_global.gameRoot = this;
var bonusWaitCount = 0;
var inputController = new FieldCheck();
var myWorld = new World(world,600,450,10,10);
var my3d = new Render3d(myWorld);
var civs = new Civilians();
var cars = new Cars();
var i = 1;
while(i <= 7)
{
   civs.createCiv(world,"civilian","civ" + i,random(2000),random(2000));
   i++;
}
cars.createCar(world,"hummer","car1",3900,3800,0,1,0);
var i = 2;
while(i <= 4)
{
   cars.createCar(world,"hummer","car" + i,1800,1800,random(360),2 + random(11));
   i++;
}
init();
