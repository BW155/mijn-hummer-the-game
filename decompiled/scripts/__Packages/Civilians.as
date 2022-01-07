class Civilians
{
   static var civArray = new Array();
   function Civilians()
   {
      Civilians.civCount = 0;
   }
   function createCiv(target, idName, newName, startX, startY)
   {
      var objHook = this;
      this.worldTarget = target;
      Civilians.layerTarget = this.worldTarget.civLayer;
      Civilians.civCount = Civilians.civCount + 1;
      Civilians.layerTarget.attachMovie(idName,newName,Civilians.civCount);
      var civ = Civilians.layerTarget[newName];
      Civilians.civArray.push(civ);
      civ.init = function(xPos, yPos)
      {
         this._x = xPos;
         this._y = yPos;
         this.alive = true;
         this.theColor = 1 + random(9);
         this.id = Civilians.civCount;
         this.angry = false;
         this.offsetX = 0;
         this.offsetY = 0;
         this.walkTime = random(30);
         this.walkCount = 0;
         this.myRotation = random(360);
         this.changeSpeed(1);
      };
      civ.hitObject = function(mc)
      {
         if(this.oldx > this._x)
         {
            this.offsetX = 1;
         }
         else
         {
            this.offsetX = -1;
         }
         if(this.oldy > this._y)
         {
            this.offsetY = 1;
         }
         else
         {
            this.offsetY = -1;
         }
         this._x = this.oldx + this.offsetX;
         this._y = this.oldy + this.offsetY;
         this.walkCount = this.walkTime - 95;
         this.civClip._rotation = 0;
         this.civClip._rotation = this.civClip._rotation + (-90 + 180 / (1 + random(2)));
      };
      civ.rotateTo = function(xpoint, ypoint)
      {
         this.oldRotation = this.civClip._rotation;
         this.xx = this._x - xpoint;
         this.yy = this._y - ypoint;
         this.myRotation = (- Math.atan2(this.xx,this.yy)) / 0.017453292519943295;
         this.civClip._rotation = this.myRotation;
         if(this.civClip._rotation <= 0)
         {
            this.rr = 360 - Math.abs(this.civClip._rotation);
         }
         else
         {
            this.rr = this.civClip._rotation;
         }
      };
      civ.changeSpeed = function(val)
      {
         this.civClip._rotation = this.myRotation;
         this.speed = val;
         this.gotoAndStop(1 + this.speed);
      };
      civ.hit = function(theCar)
      {
         if(theCar.speed > 0)
         {
            if(!this.angry && theCar._name == "car1")
            {
               this._parent._parent._parent.meters.Mrespect.gotoAndStop(this._parent._parent._parent.meters.Mrespect._currentframe + 2);
               this._parent._parent._parent.kompas.signal.gotoAndPlay("yellow");
               _global.playSound("screem" + (1 + random(12)));
            }
            this.angry = true;
            this.myRotation = theCar._rotation - (- theCar.band1._rotation) * 2;
            this.changeSpeed(4);
         }
         else if(theCar.speed < 0)
         {
            if(!this.angry && theCar._name == "car1")
            {
               this._parent._parent._parent.meters.Mrespect.gotoAndStop(this._parent._parent._parent.meters.Mrespect._currentframe + 2);
               this._parent._parent._parent.kompas.signal.gotoAndPlay("yellow");
               _global.playSound("screem" + (1 + random(12)));
            }
            this.angry = true;
            this.myRotation = theCar._rotation - (- theCar.band1._rotation) + 180;
            this.changeSpeed(4);
         }
         else
         {
            this.walkCount = this.walkTime - (20 + random(30));
            this._x = this.oldx;
            this.myRotation = this.myRotation - 180;
            this.changeSpeed(1);
         }
         if(Math.abs(theCar.speed) > 4)
         {
            theCar.speed = theCar.speed / 1.5;
            this.alive = false;
            this.speed = 0;
            this.gotoAndStop("dead");
            if(theCar._name == "car1")
            {
               var _loc4_ = this._parent._parent._parent.meters.Mrespect._currentframe - 6;
               if(_loc4_ < 1)
               {
                  _loc4_ = 1;
               }
               this._parent._parent._parent.meters.Mrespect.gotoAndStop(_loc4_);
               this._parent._parent._parent.kompas.signal.gotoAndPlay("yellow");
               if(this._parent._parent._parent.missionNr > 2)
               {
                  _global.playVoice("driveSample" + (1 + random(23)));
               }
            }
         }
         if(theCar.expl.hitTest(civ))
         {
            this.alive = false;
            this.speed = 0;
            this.gotoAndStop("dead");
            this.civClip._rotation = -180 + random(360);
            _global.playSound("screem" + (1 + random(12)));
            if(this._parent._parent._parent.missionNr > 2)
            {
               _global.playVoice("driveSample" + (1 + random(23)));
            }
         }
      };
      civ.init(startX,startY);
      civ.onEnterFrame = function()
      {
         objHook.walk(this);
         if(civ.alive)
         {
            objHook.ai(this);
            var _loc2_ = 0;
            while(_loc2_ < World.newTileArray.length)
            {
               this.tile = World.layerTarget["m" + World.newTileArray[_loc2_]];
               if(this.hitTest(this.tile))
               {
                  if(this.angry == false && this.tile.civArea.hitTest(this._x + objHook.worldTarget._x,this._y + objHook.worldTarget._y,true))
                  {
                     this.hitObject(this.tile.civArea);
                     break;
                  }
                  if(this.tile.playerArea.hitTest(this._x + objHook.worldTarget._x,this._y + objHook.worldTarget._y,true))
                  {
                     this.hitObject(this.tile.playerArea);
                     break;
                  }
               }
               _loc2_ = _loc2_ + 1;
            }
         }
      };
      return civ;
   }
   function walk(civ)
   {
      civ.oldx = civ._x;
      civ.oldy = civ._y;
      civ._x = civ._x + Math.sin(0.017453292519943295 * civ.civClip._rotation) * civ.speed;
      civ._y = civ._y + Math.cos(0.017453292519943295 * civ.civClip._rotation) * civ.speed * -1;
      this.leaveArea(civ);
   }
   function leaveArea(civ)
   {
      var _loc3_ = Math.abs(this.worldTarget._x);
      var _loc4_ = Math.abs(this.worldTarget._y);
      if(civ._x < _loc3_ - 450)
      {
         civ._x = _loc3_ + World.screenW;
         this.resetCiv(civ);
      }
      if(civ._x > _loc3_ + World.screenW + 650)
      {
         civ._x = _loc3_ - 100;
         this.resetCiv(civ);
      }
      if(civ._y < _loc4_ - 650)
      {
         civ._y = _loc4_ + World.screenH;
         this.resetCiv(civ);
      }
      if(civ._y > _loc4_ + World.screenH + 450)
      {
         civ._y = _loc4_ - 100;
         this.resetCiv(civ);
      }
   }
   function resetCiv(civ)
   {
      var _loc2_ = 0;
      while(_loc2_ < World.newTileArray.length)
      {
         var _loc3_ = World.layerTarget["m" + World.newTileArray[_loc2_]];
         if(civ.hitTest(_loc3_))
         {
            if(_loc3_.people == false)
            {
               civ._x = this.worldTarget._x;
               civ._y = this.worldTarget._y;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      civ.alive = true;
      civ.angry = false;
      civ.theColor = 1 + random(9);
      if(civ.theColor == 9)
      {
         civ.changeSpeed(2 + random(2));
      }
      else
      {
         civ.changeSpeed(random(3));
      }
   }
   function ai(civ)
   {
      civ.walkCount = civ.walkCount + 1;
      if(civ.walkCount > civ.walkTime && civ.angry == false)
      {
         civ.walkCount = 0;
         civ.walkTime = 40 * (1 + random(10));
         if(civ.hitWall)
         {
            civ.myRotation = civ.myRotation + (-90 + 180 * random(2));
            civ.hitWall = false;
         }
         else
         {
            civ.myRotation = -180 + 45 * random(4);
         }
         if(civ.theColor == 9)
         {
            civ.changeSpeed(2 + random(2));
         }
         else
         {
            civ.changeSpeed(random(3));
         }
      }
   }
}
