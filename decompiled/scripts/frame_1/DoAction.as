stop();
gamePauze = true;
if(ready == undefined)
{
   ready = false;
   this.onEnterFrame = function()
   {
      ifFrameLoaded(_totalframes + 0)
      {
         delete this.onEnterFrame;
         ready = true;
         missionNr = 1;
         gotoAndStop("game");
      }
   };
}
