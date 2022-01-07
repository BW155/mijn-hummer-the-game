var count = 0;
this.onEnterFrame = function()
{
   if(txt._y < -350)
   {
      txt._alpha = txt._alpha - 2;
      if(txt._alpha <= 0)
      {
         if(count++ > 60)
         {
            delete this.onEnterFrame;
            _parent.gotoAndStop("titleScreen");
         }
      }
   }
   else
   {
      txt._y = txt._y - 1.5;
   }
};
