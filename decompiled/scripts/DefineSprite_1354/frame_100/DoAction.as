stop();
count = 0;
this.onEnterFrame = function()
{
   if(count++ > 160)
   {
      gotoAndStop(1);
      delete this.onEnterFrame;
   }
};
