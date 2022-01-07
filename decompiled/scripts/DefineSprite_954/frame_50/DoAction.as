stop();
if(gameRoot.submission == 3)
{
   delete this.onEnterFrame;
   gameRoot.gamePauze = true;
   gameRoot.fadeClip.gotoAndStop("wellDone");
   gameRoot.player.speed = 0;
}
else
{
   gameRoot.submission = 3;
   gameRoot.kompas.arrowTarget = {x:847,y:3890};
}
_parent.removeMovieClip();
