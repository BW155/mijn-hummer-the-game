stop();
var count = 0;
this.onEnterFrame = function()
{
   if(count++ > 287)
   {
      delete this.onEnterFrame;
      gotoAndStop("skipTekst");
      play();
   }
};
