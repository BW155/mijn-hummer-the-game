stop();
if(gameRoot.gameOver)
{
   _parent.missionStatus = "gameOver";
}
else
{
   _parent.missionStatus = "failed";
}
_parent.gotoAndPlay("close");
