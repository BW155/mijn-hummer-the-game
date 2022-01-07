function mission1()
{
   player.speed = 2;
   player.gotoAndStop(1);
   player._x = 3900;
   player._y = 3800;
   player._rotation = -60;
   kompas.arrowTarget = {x:4000,y:3800};
}
function mission2()
{
   player.speed = 0;
   player._x = 3986;
   player._y = 3880;
   player._rotation = 0;
   kompas.arrowTarget = {x:5300,y:900};
}
function mission3()
{
   player.speed = 0;
   player._x = 5120;
   player._y = 1002;
   player._rotation = -30;
   kompas.arrowTarget = {x:1100,y:650};
   submission = 1;
}
function mission4()
{
   player.gotoAndStop(1);
   player.speed = 2;
   player._x = 5587;
   player._y = 2311;
   player._rotation = 180;
   kompas.arrowTarget = {x:839,y:2830};
   submission = 1;
}
function mission5()
{
   player.speed = 0;
   player._x = 847;
   player._y = 3890;
   player._rotation = 180;
   kompas.arrowTarget = {x:6000,y:4300};
}
function mission6()
{
   player.speed = 0;
   player._x = 5810;
   player._y = 4290;
   player._rotation = 110;
   kompas.arrowTarget = {x:400,y:1400};
}
function mission7()
{
   player.speed = 0;
   player._x = 120;
   player._y = 1520;
   player._rotation = 90;
   kompas.arrowTarget = {x:3050,y:1000};
}
function mission8()
{
   player.speed = 0;
   player._x = 2900;
   player._y = 900;
   player._rotation = 0;
   kompas.arrowTarget = {x:1200,y:2000};
}
function setMission()
{
   meters.bonusClip.points = 60;
   meters.bonusClip.bonus = 60;
   this["mission" + missionNr]();
}
