var startPoints = 4;
var roadPointCount = 2;
rpClip1.dir = "x-";
rpClip2.dir = "x+";
var sp1 = {x:rpClip1._x,y:rpClip1._y,dir:"x-",roadSide:"not"};
var sp2 = {x:rpClip1._x,y:rpClip1._y,dir:"x-",roadSide:"same"};
var sp3 = {x:rpClip2._x,y:rpClip2._y,dir:"x+",roadSide:"not"};
var sp4 = {x:rpClip2._x,y:rpClip2._y,dir:"x+",roadSide:"same"};
var startPointArray = new Array();
var i = 1;
while(i <= startPoints)
{
   sp = this["sp" + i];
   startPointArray.push(sp);
   i++;
}
