stop();
if(_parent._name == "car1")
{
   gameRoot.gameOver = true;
   gameRoot.gamePauze = true;
   _parent.speed = 0;
   gameRoot.fadeClip.gotoAndStop("gameOver");
   gameRoot.missionNr = 1;
}
