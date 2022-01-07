playSound("splat");
playSound("screem9");
_parent.killCount = _parent.killCount + 1;
if(_parent.killCount > 3)
{
   gameRoot.gamePauze = true;
   gameRoot.fadeClip.gotoAndStop("failed");
   gameRoot.player.speed = 0;
   delete _parent.onEnterFrame;
}
