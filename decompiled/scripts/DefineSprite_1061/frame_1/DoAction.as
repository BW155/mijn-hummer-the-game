function btnAction(nr)
{
   Key.removeListener(myListener);
   switch(nr)
   {
      case 1:
         playMusic("titleTuneStop");
         gameRoot.score = 0;
         gameRoot.bonusScore = 0;
         gameRoot.missionNr = 1;
         gameRoot.gameOver = false;
         gameRoot.gamePauze = true;
         gameRoot.secret = false;
         gameRoot.meters.secretFound.gotoAndStop(1);
         gameRoot.groenePruikCount = 0;
         gameRoot.meters.Mstatus.gotoAndStop(1);
         gameRoot.meters.Mrespect.gotoAndStop(1);
         gameRoot.player.damage = 100;
         gameRoot.player.deuren.d1.gotoAndStop(1);
         gameRoot.player.deuren.d2.gotoAndStop(1);
         gameRoot.player.deuren.d4.gotoAndStop(1);
         gameRoot.player.deuren.d5.gotoAndStop(1);
         gameRoot.meters.Msecurity._xscale = gameRoot.player.damage;
         _parent.gotoAndStop("missionTalk");
         break;
      case 2:
         gameRoot.score = -1;
         _parent.gotoAndStop("highScores");
         break;
      case 3:
         _parent.gotoAndStop("options");
         break;
      case 4:
         _parent.gotoAndStop("sendFriend");
         break;
      case 5:
         _parent.gotoAndStop("credits");
   }
}
mainNav.gotoAndStop(1);
myListener = new Object();
myListener.onKeyDown = function()
{
   if(Key.isDown(38))
   {
      mainNav.gotoAndStop(mainNav._currentframe - 1);
   }
   if(Key.isDown(40))
   {
      mainNav.gotoAndStop(mainNav._currentframe + 1);
   }
   if(Key.isDown(13))
   {
      btnAction(mainNav._currentframe);
   }
};
Key.addListener(myListener);
