function initMission4()
{
   myHummer = gameRoot.player;
   weedCount = 3;
   counter = weedCount;
   weed1.hit = false;
   weed2.hit = false;
   weed3.hit = false;
   spliff();
}
function spliff()
{
   this.onEnterFrame = function()
   {
      i = 1;
      while(i <= weedCount)
      {
         ico = this["weed" + i];
         if(ico.hit == false && ico.hitObj.hitTest(myHummer))
         {
            counter--;
            ico.hit = true;
            ico.gotoAndPlay("end");
            if(counter < 1)
            {
               delete this.onEnterFrame;
               playVoice("mission42");
               gameRoot.submission = 2;
               gameRoot.kompas.arrowTarget = {x:4291,y:2018};
            }
         }
         i++;
      }
   };
}
initMission4();
