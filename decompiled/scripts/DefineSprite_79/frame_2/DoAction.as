i = 1;
max = 30;
count = 20;
this.onEnterFrame = function()
{
   if(count++ > 4)
   {
      count = 0;
      if(i >= max)
      {
         i = 1;
      }
      fire.duplicateMovieClip("fire" + i,i);
      f = this["fire" + i];
      f._yscale = 30 + random(50);
      f._x = fire._x + (-15 + random(30));
      i++;
   }
};
