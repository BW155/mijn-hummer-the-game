class Cars
{
   static var carArray = new Array();
   function Cars(player)
   {
      this.carCount = 0;
      player;
   }
   function createCar(target, idName, newName, startX, startY, startRot, carType, startSpeed)
   {
      var objHook = this;
      this.worldTarget = target;
      Cars.layerTarget = target.carLayer;
      this.carCount = this.carCount + 1;
      Cars.layerTarget.attachMovie(idName,newName,this.carCount);
      var _loc2_ = Cars.layerTarget[newName];
      _loc2_.carTarget = target.carTargetLayer.attachMovie("cartarget","carTarget" + this.carCount,this.carCount);
      _loc2_.carShadow = target.carShadowLayer.attachMovie("carShadow","carShadow" + this.carCount,this.carCount);
      _loc2_.carShadow.gotoAndStop(carType);
      _loc2_.gotoAndStop(carType);
      _loc2_.speed = startSpeed;
      Cars.carArray.push(_loc2_);
      _loc2_.init = function(xPos, yPos, rot, carType)
      {
         this.id = this.carCount;
         this._x = xPos;
         this._y = yPos;
         this._rotation = rot;
         this.carType = carType;
         objHook.setCar(this,14,0.22,1.3,0.4);
      };
      _loc2_.init(startX,startY,startRot);
      return _loc2_;
   }
   function setCar(myCar, topSpeed, power, turnAccel, skidMax)
   {
      var objHook = this;
      if(myCar._name == "car1")
      {
         myCar.damage = 100;
      }
      else
      {
         myCar.damage = 5;
      }
      myCar.robot = true;
      myCar.driving = false;
      myCar.robotSpeed = 2 + random(4);
      myCar.gas = false;
      myCar.band1._rotation = 0;
      myCar.band2._rotation = 0;
      myCar.count = 0;
      myCar.waitTime = 100 * (1 + random(5));
      myCar.skidMax = skidMax;
      myCar.skidFactor = skidMax;
      myCar.topSpeed = topSpeed;
      myCar.power = power;
      myCar.accelFactor = 0;
      myCar.turnAccel = turnAccel;
      myCar.skidMax = skidMax;
      myCar.skidspeed = 0;
      myCar.botsSpeedX = 0;
      myCar.botsSpeedY = 0;
      myCar.turn = 0;
      myCar.carRot = 0;
      myCar.skidX = 0;
      myCar.skidY = 0;
      myCar.carDX = 0;
      myCar.carDY = 0;
      myCar.prevcarDX = 0;
      myCar.prevcarDY = 0;
      myCar.oldx = 0;
      myCar.oldy = 0;
      myCar.brake1 = false;
      myCar.bots = false;
      myCar.onEnterFrame = function()
      {
         if(!this.gas && !this.robot)
         {
            this.speed = this.speed / 1.06;
            if(Math.abs(this.speed) < 0.1)
            {
               this.speed = 0;
            }
         }
         if(this.speed < -7)
         {
            this.speed = -7;
         }
         this.oldx = this._x;
         this.oldy = this._y;
         this.oldRotation = this._rotation;
         if(!this.robot)
         {
            this.band1._rotation = this.band1._rotation + this.turn;
            this.band1._rotation = this.band1._rotation / (1 + Math.abs(this.speed / 10));
            this.band2._rotation = this.band1._rotation;
            this.carRot = this.band1._rotation * (this.speed / (12 + Math.abs(this.speed) * 7));
            this._rotation = this._rotation + this.carRot;
            this.turn = this.turn / 1.3;
         }
         else
         {
            objHook.carAI(this);
            myCar.count = myCar.count + 1;
            if(myCar.count > myCar.waitTime)
            {
               myCar.count = 0;
               var _loc8_ = 1 + random(3);
               _global.playSound("horn" + _loc8_);
               if(myCar._parent._parent._parent.missionNr > 2)
               {
                  if(_loc8_ == 2 || _loc8_ == 1)
                  {
                     _global.playVoice("talk" + (1 + random(36)));
                  }
               }
            }
         }
         if(this.skidFactor > 1)
         {
            this.skidFactor = this.skidFactor / 1.05;
         }
         this.skidspeed = this.speed * this.skidFactor;
         if(this.skidspeed < 1)
         {
            this.skidspeed = 1;
         }
         this.xx = Math.sin(0.017453292519943295 * this._rotation) * this.speed;
         this.yy = Math.cos(0.017453292519943295 * this._rotation) * this.speed * -1;
         this.skidX = (this.xx - this.prevcarDX) / this.skidspeed;
         this.skidY = (this.yy - this.prevcarDY) / this.skidspeed;
         this.xx = this.prevcarDX + this.skidX;
         this.yy = this.prevcarDY + this.skidY;
         if(this.robot == false)
         {
            this._x = this._x + this.xx;
            this._y = this._y + this.yy;
         }
         this.carShadow._x = this._x - this.accelFactor + 4;
         this.carShadow._y = this._y - this.accelFactor + 4;
         this.carShadow._rotation = this._rotation;
         this.prevcarDX = this.xx;
         this.prevcarDY = this.yy;
         objHook.leaveArea(this);
         if(myCar._rotation <= 0)
         {
            myCar.rr = 360 - Math.abs(myCar._rotation);
         }
         else
         {
            myCar.rr = myCar._rotation;
         }
         var _loc5_ = 0;
         while(_loc5_ < Cars.carArray.length)
         {
            var _loc4_ = Cars.carArray[_loc5_];
            if(this._name != _loc4_._name)
            {
               if(Math.abs(this.speed) >= Math.abs(_loc4_.speed))
               {
                  objHook.hitBlock(this,_loc4_);
               }
            }
            _loc5_ = _loc5_ + 1;
         }
         _loc5_ = 0;
         while(_loc5_ < World.newTileArray.length)
         {
            var _loc7_ = World.newTileArray[_loc5_];
            var _loc6_ = World.layerTarget["m" + _loc7_];
            if(this.hitTest(_loc6_))
            {
               objHook.hitBlock(this,_loc6_.playerArea);
            }
            _loc5_ = _loc5_ + 1;
         }
         _loc5_ = 0;
         while(_loc5_ < Civilians.civArray.length)
         {
            var _loc3_ = Civilians.civArray[_loc5_];
            if(this.hitTest(_loc3_._x + objHook.worldTarget._x - this.xx * 5,_loc3_._y + objHook.worldTarget._y - this.yy * 5,true) && _loc3_.alive)
            {
               _loc3_.hit(this);
            }
            _loc5_ = _loc5_ + 1;
         }
      };
   }
   function hitBlock(myCar, obj)
   {
      var _loc8_ = this;
      var _loc7_ = 1;
      while(_loc7_ <= 8)
      {
         myCar.cp = myCar["cp" + _loc7_];
         var _loc5_ = new Object();
         _loc5_.x = myCar.cp._x;
         _loc5_.y = myCar.cp._y;
         myCar.localToGlobal(_loc5_);
         if(obj.hitTest(_loc5_.x + myCar.xx,_loc5_.y + myCar.yy,true))
         {
            var _loc6_ = 1 + int(Math.abs(myCar.speed));
            if(myCar._currentframe != myCar._totalframes)
            {
               myCar.damage = myCar.damage - _loc6_ / 15;
               if(myCar._name == "car1")
               {
                  myCar._parent._parent._parent.meters.Msecurity._xscale = myCar.damage;
                  myCar._parent._parent._parent.kompas.signal.gotoAndPlay("red");
                  if(_loc6_ > 1 && _loc6_ < 8)
                  {
                     _global.playSound("crash1");
                     if(myCar._parent._parent._parent.missionNr > 2)
                     {
                        _global.playVoice("bots" + (1 + random(8)));
                     }
                  }
                  else if(_loc6_ > 8)
                  {
                     _global.playSound("crash2");
                     if(myCar._parent._parent._parent.missionNr > 2)
                     {
                        _global.playVoice("bots" + (1 + random(8)));
                     }
                  }
               }
               obj.damage = obj.damage - _loc6_ / 15;
            }
            if(myCar.damage < 1)
            {
               myCar.gotoAndStop("explode");
               myCar.damage = 0;
            }
            if(obj.damage < 1)
            {
               obj.gotoAndStop("explode");
               obj.damage = 0;
            }
            obj.gas = false;
            myCar.gas = false;
            obj.robot = false;
            myCar.robot = false;
            if(myCar.oldx > myCar._x)
            {
               myCar.offsetX = 3;
            }
            else
            {
               myCar.offsetX = -3;
            }
            if(myCar.oldy > myCar._y)
            {
               myCar.offsetY = 3;
            }
            else
            {
               myCar.offsetY = -3;
            }
            obj._x = obj.oldx + myCar.xx;
            obj._y = obj.oldy + myCar.yy;
            if(myCar.rr - obj.rr <= 90 && myCar.rr - obj.rr >= -90)
            {
               obj.band1._rotation = myCar.rr - obj.rr;
               obj.speed = myCar.speed + myCar.turnAccel / 2;
            }
            else
            {
               obj.band1._rotation = - myCar.rr - obj.rr;
               obj.speed = - myCar.speed + myCar.turnAccel / 2;
            }
            myCar.band1._rotation = myCar.band1OldRot;
            myCar._x = myCar.oldx + myCar.offsetX;
            myCar._y = myCar.oldy + myCar.offsetY;
            myCar._rotation = myCar.oldRotation;
            myCar.speed = myCar.speed / 3;
         }
         _loc7_ = _loc7_ + 1;
      }
   }
   function leaveArea(myCar)
   {
      var _loc3_ = Math.abs(this.worldTarget._x);
      var _loc4_ = Math.abs(this.worldTarget._y);
      if(myCar._x < _loc3_ - 350 || myCar._x > _loc3_ + World.screenW + 350 || myCar._y < _loc4_ - 350 || myCar._y > _loc4_ + World.screenH + 350)
      {
         this.resetCar(myCar,_loc3_,_loc4_);
      }
      if(myCar._name == "car1")
      {
         if(myCar._x < 0)
         {
            myCar._x = 0;
            myCar.speed = (- myCar.speed) / 2;
         }
         else if(myCar._y < 0)
         {
            myCar._y = 0;
            myCar.speed = (- myCar.speed) / 2;
         }
         else if(myCar._x > World.mapW)
         {
            myCar._x = World.mapW;
            myCar.speed = (- myCar.speed) / 2;
         }
         else if(myCar._y > World.mapH)
         {
            myCar._y = World.mapH;
            myCar.speed = (- myCar.speed) / 2;
         }
      }
   }
   function resetCar(myCar, gameWorldX, gameWorldY)
   {
      if(myCar._name != "car1")
      {
         myCar.waitTime = 130 * (1 + random(5));
         myCar.damage = 5;
      }
      myCar._visible = true;
      var _loc6_ = 0;
      while(_loc6_ < World.newTileArray.length)
      {
         var _loc10_ = World.newTileArray[_loc6_];
         var _loc3_ = World.layerTarget["m" + _loc10_];
         if(this.worldTarget.carLayer.car1.hitTest(_loc3_))
         {
            if(_loc3_.people != false)
            {
               myCar.carType = 2 + random(myCar._totalframes - 2);
               myCar.carShadow.gotoAndStop(myCar.carType);
               myCar.gotoAndStop(myCar.carType);
               myCar.robot = true;
               var _loc4_ = 70;
               if(myCar.rndPoint != undefined)
               {
                  _loc3_.startPointArray.push(myCar.rndPoint);
               }
               if(_loc3_.startPointArray != undefined)
               {
                  var _loc7_ = random(_loc3_.startPointArray.length);
                  var _loc5_ = _loc3_.startPointArray[_loc7_];
                  if(myCar.rndPoint != undefined)
                  {
                     _loc3_.startPointArray.push(myCar.rndPoint);
                  }
                  _loc3_.startPointArray.splice(_loc7_,1);
                  myCar.rndPoint = _loc5_;
                  myCar.carTarget.dir = _loc5_.dir;
                  if(_loc5_.dir == "x+")
                  {
                     myCar._y = myCar.rndPoint.y + _loc3_._y;
                     myCar.carTarget._y = myCar._y;
                     myCar._rotation = 90;
                     if(myCar.rndPoint.roadSide == "same")
                     {
                        myCar._x = gameWorldX + World.screenW + 200;
                        myCar.carTarget._x = myCar._x + _loc4_;
                     }
                     else
                     {
                        myCar._x = gameWorldX - 200;
                        myCar.carTarget._x = myCar._x + _loc4_;
                     }
                  }
                  if(myCar.rndPoint.dir == "x-")
                  {
                     myCar._y = myCar.rndPoint.y + _loc3_._y;
                     myCar.carTarget._y = myCar._y;
                     myCar._rotation = -90;
                     if(myCar.rndPoint.roadSide == "same")
                     {
                        myCar._x = gameWorldX - 200;
                        myCar.carTarget._x = myCar._x - _loc4_;
                     }
                     else
                     {
                        myCar._x = gameWorldX + World.screenW + 200;
                        myCar.carTarget._x = myCar._x - _loc4_;
                     }
                  }
                  if(myCar.rndPoint.dir == "y+")
                  {
                     myCar._x = myCar.rndPoint.x + _loc3_._x;
                     myCar.carTarget._x = myCar._x;
                     myCar._rotation = 180;
                     if(myCar.rndPoint.roadSide == "same")
                     {
                        myCar._y = gameWorldY + World.screenH + 200;
                        myCar.carTarget._y = myCar._y + _loc4_;
                     }
                     else
                     {
                        myCar._y = gameWorldY - 200;
                        myCar.carTarget._y = myCar._y + _loc4_;
                     }
                  }
                  if(myCar.rndPoint.dir == "y-")
                  {
                     myCar._x = myCar.rndPoint.x + _loc3_._x;
                     myCar.carTarget._x = myCar._x;
                     myCar._rotation = 0;
                     if(myCar.rndPoint.roadSide == "same")
                     {
                        myCar._y = gameWorldY - 200;
                        myCar.carTarget._y = myCar._y - _loc4_;
                     }
                     else
                     {
                        myCar._y = gameWorldY + World.screenH + 200;
                        myCar.carTarget._y = myCar._y - _loc4_;
                     }
                  }
               }
            }
         }
         _loc6_ = _loc6_ + 1;
      }
   }
   function carAI(myCar)
   {
      this.carMovement(myCar);
      this.carFollow(myCar);
      var _loc6_ = 0;
      while(_loc6_ < World.newTileArray.length)
      {
         var _loc7_ = World.newTileArray[_loc6_];
         var _loc4_ = World.layerTarget["m" + _loc7_];
         if(myCar.hitTest(_loc4_))
         {
            if(_loc4_.roadPointCount != undefined)
            {
               var _loc5_ = 1;
               while(_loc5_ <= _loc4_.roadPointCount)
               {
                  var _loc2_ = _loc4_["rpClip" + _loc5_];
                  if(myCar.carTarget.hitTest(_loc2_))
                  {
                     if(myCar.carTarget.dir == "y-" && myCar.carTarget._y - myCar.robotSpeed <= _loc2_._y + _loc4_._y)
                     {
                        if(_loc2_.dir == "x+" || _loc2_.dir == "x-")
                        {
                           myCar.carTarget.dir = _loc2_.dir;
                           myCar.carTarget._y = _loc2_._y + _loc4_._y;
                        }
                     }
                     else if(myCar.carTarget.dir == "y+" && myCar.carTarget._y + myCar.robotSpeed >= _loc2_._y + _loc4_._y)
                     {
                        if(_loc2_.dir == "x+" || _loc2_.dir == "x-")
                        {
                           myCar.carTarget.dir = _loc2_.dir;
                           myCar.carTarget._y = _loc2_._y + _loc4_._y;
                        }
                     }
                     else if(myCar.carTarget.dir == "x-" && myCar.carTarget._x - myCar.robotSpeed <= _loc2_._x + _loc4_._x)
                     {
                        if(_loc2_.dir == "y+" || _loc2_.dir == "y-")
                        {
                           myCar.carTarget.dir = _loc2_.dir;
                           myCar.carTarget._x = _loc2_._x + _loc4_._x;
                        }
                     }
                     else if(myCar.carTarget.dir == "x+" && myCar.carTarget._x + myCar.robotSpeed >= _loc2_._x + _loc4_._x)
                     {
                        if(_loc2_.dir == "y+" || _loc2_.dir == "y-")
                        {
                           myCar.carTarget.dir = _loc2_.dir;
                           myCar.carTarget._x = _loc2_._x + _loc4_._x;
                        }
                     }
                  }
                  _loc5_ = _loc5_ + 1;
               }
            }
         }
         _loc6_ = _loc6_ + 1;
      }
   }
   function carMovement(myCar)
   {
      if(myCar.carTarget.dir == "y-")
      {
         myCar.carTarget._y = myCar.carTarget._y - myCar.robotSpeed;
      }
      if(myCar.carTarget.dir == "y+")
      {
         myCar.carTarget._y = myCar.carTarget._y + myCar.robotSpeed;
      }
      if(myCar.carTarget.dir == "x+")
      {
         myCar.carTarget._x = myCar.carTarget._x + myCar.robotSpeed;
      }
      if(myCar.carTarget.dir == "x-")
      {
         myCar.carTarget._x = myCar.carTarget._x - myCar.robotSpeed;
      }
   }
   function carFollow(myCar)
   {
      myCar.speed = myCar.robotSpeed;
      myCar.deltaX = myCar._x - myCar.carTarget._x;
      myCar.deltaY = myCar._y - myCar.carTarget._y;
      myCar.distance = Math.sqrt(myCar.deltaX * myCar.deltaX + myCar.deltaY * myCar.deltaY);
      if(myCar.distance < 90 && myCar.robotSpeed > 0)
      {
         myCar.speed = myCar.speed - 0.7;
      }
      else if(myCar.distance > 100 && myCar.robotSpeed > 0)
      {
         myCar.speed = myCar.speed + 0.5;
      }
      this.rotateTo(myCar,myCar.deltaX,myCar.deltaY);
      this.gotoTarget(myCar);
   }
   function rotateTo(myCar, xpoint, ypoint)
   {
      myCar._rotation = (- Math.atan2(xpoint,ypoint)) / 0.017453292519943295;
   }
   function gotoTarget(myCar)
   {
      if(Math.sqrt(myCar.deltaX * myCar.deltaX + myCar.deltaY * myCar.deltaY) > myCar.speed)
      {
         myCar._y = myCar._y - myCar.speed * Math.cos(myCar._rotation * 0.017453292519943295);
         myCar._x = myCar._x + myCar.speed * Math.sin(myCar._rotation * 0.017453292519943295);
      }
   }
}
