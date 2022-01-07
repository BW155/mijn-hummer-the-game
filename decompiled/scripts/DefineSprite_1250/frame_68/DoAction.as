stop();
if(missionStatus == "done")
{
   _parent.missionNr = _parent.missionNr + 1;
   if(_parent.missionNr < 9)
   {
      gotoAndStop("missionTalk");
   }
   else
   {
      gotoAndStop("endGame");
   }
}
else if(missionStatus == "failed")
{
   gotoAndStop("missionTalk");
}
else if(missionStatus == "gameOver")
{
   gotoAndStop("GO");
}
