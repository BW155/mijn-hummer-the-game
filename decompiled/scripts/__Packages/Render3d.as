class Render3d
{
   function Render3d(theWorld)
   {
      this.myWorld = theWorld;
      this.world = this.myWorld.worldTarget;
      this.screenW = World.screenW;
      this.screenH = World.screenH;
   }
   function renderObj()
   {
      var _loc10_ = 0;
      while(_loc10_ <= this.myWorld.renderArray.length)
      {
         var _loc2_ = this.myWorld.renderArray[_loc10_];
         this.groundWidth = _loc2_.groundWidth;
         this.groundHeight = _loc2_.groundHeight;
         this.roofWidth = _loc2_.roofWidth;
         this.roofHeight = _loc2_.roofHeight;
         if(- this.world._x + this.screenW > _loc2_._x && - this.world._x < _loc2_._x + this.groundWidth)
         {
            if(- this.world._y + this.screenH > _loc2_._y && - this.world._y < _loc2_._y + this.groundHeight)
            {
               _loc2_.gotoAndStop("build");
               _loc2_._visible = true;
            }
         }
         if(- this.world._x + this.screenW < _loc2_._x || - this.world._x > _loc2_._x + this.groundWidth || (- this.world._y + this.screenH < _loc2_._y || - this.world._y > _loc2_._y + this.groundHeight))
         {
            _loc2_.gotoAndStop("delete");
            _loc2_._visible = false;
         }
         if(_loc2_._visible)
         {
            var _loc9_ = this.world._x + _loc2_._x;
            var _loc8_ = this.world._y + _loc2_._y;
            var _loc12_ = (_loc9_ + 270) / 965;
            var _loc11_ = (_loc8_ + 300) / 885;
            var _loc6_ = int(_loc12_ * 305) + 1;
            var _loc7_ = int(_loc11_ * 305) + 1;
            if(_loc2_.id == 1)
            {
               _loc2_.side1.gotoAndStop(_loc6_);
               _loc2_.side2.gotoAndStop(_loc6_);
               _loc2_.side3.gotoAndStop(_loc7_);
               _loc2_.side4.gotoAndStop(_loc7_);
               _loc2_.roof._x = _loc2_.side2.xRoof._x - this.roofWidth / 2;
               _loc2_.roof._y = _loc2_.side3.xRoof._y - this.roofHeight / 2;
               _loc2_.side1._yscale = _loc2_.ground._y + this.groundHeight - (_loc2_.roof._y + this.roofHeight);
               _loc2_.side2._yscale = _loc2_.roof._y - _loc2_.ground._y;
               _loc2_.side3._xscale = _loc2_.ground._x + _loc2_.roof._x;
               _loc2_.side4._xscale = _loc2_.ground._x + this.groundWidth - (_loc2_.roof._x + this.roofWidth);
               var _loc3_ = 1;
               while(_loc3_ <= 4)
               {
                  var _loc4_ = _loc2_["side" + _loc3_];
                  if(_loc4_._yscale < 0 || _loc4_._xscale < 0)
                  {
                     _loc4_._visible = false;
                  }
                  else
                  {
                     _loc4_._visible = true;
                  }
                  _loc3_ = _loc3_ + 1;
               }
            }
            if(_loc2_.id == 2)
            {
               _loc3_ = 1;
               while(_loc3_ <= 3)
               {
                  var _loc5_ = _loc2_["part" + _loc3_];
                  _loc5_._x = 70 + ((_loc6_ + 35) * _loc3_ - 180 * _loc3_) / 5;
                  _loc5_._y = 65 + (_loc7_ * _loc3_ - 180 * _loc3_) / 5;
                  _loc3_ = _loc3_ + 1;
               }
               this.myDepth = 10000 - this.getDistance(_loc9_ - this.screenW / 2,_loc8_ - this.screenH / 2);
            }
            else
            {
               this.myDepth = 10000 - this.getDistance(_loc9_ - this.screenW / 2 + 90,_loc8_ - this.screenH / 2 + 90);
            }
            _loc2_.swapDepths(this.myDepth);
         }
         _loc10_ = _loc10_ + 1;
      }
   }
   function getDistance(x1, y1)
   {
      var _loc3_ = x1 * x1;
      var _loc2_ = y1 * y1;
      var _loc1_ = _loc3_ + _loc2_;
      return Math.sqrt(_loc1_);
   }
}
