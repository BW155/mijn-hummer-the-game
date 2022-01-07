function controls(myCar)
{
   if(Key.isDown(38))
   {
      myCar.gas = true;
      if(myCar.speed < myCar.topSpeed)
      {
         myCar.speed = myCar.speed + myCar.accelFactor;
         playSound("drive");
      }
   }
   else if(Key.isDown(40))
   {
      myCar.gas = true;
      myCar.speed = myCar.speed - myCar.accelFactor;
      playSound("drive");
   }
   else
   {
      if(myCar.gas)
      {
         myCar.gas = false;
      }
      playSound("stopDrive");
   }
   if(Key.isDown(37))
   {
      if(myCar.band1._rotation > -40)
      {
         myCar.turn = myCar.turn - (myCar.turnAccel + Math.abs(myCar.speed) / 1.6);
      }
      else
      {
         myCar.band1._rotation = -40;
      }
   }
   if(Key.isDown(39))
   {
      if(myCar.band1._rotation < 40)
      {
         myCar.turn = myCar.turn + (myCar.turnAccel + Math.abs(myCar.speed) / 1.6);
      }
      else
      {
         myCar.band1._rotation = 40;
      }
   }
   if(Key.isDown(32))
   {
      if(Math.abs(myCar.speed) < 3 && myCar.brake1 == true)
      {
         playSound("stopdrift");
      }
      if(myCar.brake1 == false)
      {
         if(myCar.speed > 0)
         {
            myCar.skidFactor = myCar.skidFactor + myCar.speed;
            myCar.speed = myCar.speed / 4;
         }
         if(myCar.speed > 3)
         {
            playSound("drift");
         }
      }
      myCar.brake1 = true;
      myCar.accelFactor = 0;
      myCar.skidFactor = myCar.skidFactor / (1 + myCar.power / 4);
      myCar.speed = myCar.speed / 1.01;
   }
   else
   {
      if(myCar.brake1)
      {
         myCar.brake1 = false;
         playSound("stopdrift");
      }
      myCar.accelFactor = myCar.power;
   }
}
