stop();
ground._x = 0;
ground._y = 0;
side1._x = ground._x;
side1._y = ground._y + ground._height;
side2._x = ground._x;
side2._y = ground._y;
side3._x = ground._x;
side3._y = ground._y;
side4._x = ground._x + ground._width;
side4._y = ground._y;
side1.mface.gotoAndStop(fr1);
side2.mface.gotoAndStop(fr2);
side3.mface.gotoAndStop(fr3);
side4.mface.gotoAndStop(fr4);
roof.gotoAndStop(fr5);
if(fr1 == 14 || fr1 == 16)
{
   smoke1.gotoAndStop(2);
}
