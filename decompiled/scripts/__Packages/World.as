class World
{
   var tileArray = new Array();
   static var newTileArray = new Array();
   var killArray = new Array();
   var renderArray = new Array();
   function World(targ, scrW, scrH, mapX, mapY)
   {
      this.worldTarget = targ;
      World.layerTarget = this.worldTarget.mapLayer;
      World.screenW = scrW;
      World.screenH = scrH;
      this.mapCountX = mapX;
      this.mapCountY = mapY;
      World.mapW = this.mapCountX * World.screenW;
      World.mapH = this.mapCountY * World.screenH;
      this.camPosX = World.screenW / 2;
      this.camPosY = World.screenH / 2;
   }
   function moveWorld(player)
   {
      this.worldTarget._x = this.worldTarget._x + (this.camPosX - (player._x + this.worldTarget._x));
      this.worldTarget._y = this.worldTarget._y + (this.camPosY - (player._y + this.worldTarget._y));
      if(this.worldTarget._x > 0)
      {
         this.worldTarget._x = 0;
      }
      if(this.worldTarget._x < - World.mapW - World.screenW)
      {
         this.worldTarget._x = - World.mapW - World.screenW;
      }
      if(this.worldTarget._y > 0)
      {
         this.worldTarget._y = 0;
      }
      if(this.worldTarget._y < - World.mapH - World.screenH)
      {
         this.worldTarget._y = - World.mapH - World.screenH;
      }
      this.buildMap();
   }
   function buildMap()
   {
      var _loc2_ = 1 + int(Math.abs(this.worldTarget._x) / World.screenW);
      var _loc3_ = int(Math.abs(this.worldTarget._y) / World.screenH);
      var _loc4_ = this.tileNr1;
      this.tileNr1 = _loc2_ + _loc3_ * this.mapCountX;
      this.tileNr2 = _loc2_ + 1 + _loc3_ * this.mapCountX;
      this.tileNr3 = _loc2_ + (_loc3_ + 1) * this.mapCountX;
      this.tileNr4 = _loc2_ + 1 + (_loc3_ + 1) * this.mapCountX;
      if(this.tileNr1 != _loc4_)
      {
         this.updateTiles(this.tileNr1,this.tileNr2,this.tileNr3,this.tileNr4);
      }
   }
   function updateTiles(tileNr1, tileNr2, tileNr3, tileNr4)
   {
      World.newTileArray = new Array();
      var i = 1;
      while(i <= 4)
      {
         var nr = eval("tileNr" + i);
         World.newTileArray.push(nr);
         i++;
      }
      var i = 0;
      while(i < this.tileArray.length)
      {
         var j = 0;
         while(j < World.newTileArray.length)
         {
            if(this.tileArray[i] == World.newTileArray[j])
            {
               this.killArray.splice(i,1);
            }
            j++;
         }
         i++;
      }
      var i = 0;
      while(i < World.newTileArray.length)
      {
         var nr = World.newTileArray[i];
         if(World.layerTarget["m" + nr].id == undefined)
         {
            var tile = World.layerTarget.attachMovie("mappart" + nr,"m" + nr,nr);
            tile.id = nr;
            tile._x = (nr - 1 - int((nr - 1) / this.mapCountX) * this.mapCountX) * World.screenW;
            tile._y = int((nr - 1) / this.mapCountX) * World.screenH;
         }
         i++;
      }
      var i = 0;
      while(i < this.killArray.length)
      {
         var tile = World.layerTarget["m" + this.killArray[i]];
         var j = 0;
         while(j < tile.buildingArray.length)
         {
            var building = this.worldTarget.buildingLayer["building" + tile.id + j];
            var c = 0;
            while(c < this.renderArray.length)
            {
               if(this.renderArray[c]._name == building._name)
               {
                  this.renderArray.splice(c,1);
               }
               c++;
            }
            removeMovieClip(building);
            j++;
         }
         removeMovieClip(tile);
         i++;
      }
      this.tileArray = World.newTileArray;
      this.killArray = this.tileArray;
   }
   function createBuildings(tile, id, count)
   {
      tile.buildingArray = new Array();
      var _loc4_ = 1;
      while(_loc4_ <= count)
      {
         tile.buildingArray.push(tile["building" + _loc4_]);
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      while(_loc4_ < tile.buildingArray.length)
      {
         id = id.toString();
         var _loc7_ = _loc4_.toString();
         var _loc11_ = int(id + _loc7_);
         if(tile.buildingArray[_loc4_].mcType == "building")
         {
            var _loc9_ = "mc_building";
         }
         else
         {
            _loc9_ = "tree";
         }
         var _loc5_ = tile._parent._parent.buildingLayer.attachMovie(_loc9_,"building" + id + _loc7_,_loc11_);
         _loc5_._x = tile.buildingArray[_loc4_].x + tile._x;
         _loc5_._y = tile.buildingArray[_loc4_].y + tile._y;
         var _loc10_ = tile.buildingArray[_loc4_].graType;
         var _loc6_ = _loc10_.split("|");
         var _loc2_ = 1;
         while(_loc2_ <= 5)
         {
            _loc5_["fr" + _loc2_] = int(_loc6_[_loc2_ - 1]);
            _loc2_ = _loc2_ + 1;
         }
         false;
         this.renderArray.push(_loc5_);
         _loc4_ = _loc4_ + 1;
      }
   }
}
