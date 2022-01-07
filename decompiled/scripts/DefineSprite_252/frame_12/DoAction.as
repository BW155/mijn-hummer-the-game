var i = 2;
while(i <= 4)
{
   myCar = _parent._parent["car" + i];
   if(myCar.hitTest(this))
   {
      if(myCar.damage < 5)
      {
         myCar.gotoAndStop("explode");
      }
   }
   i++;
}
