if(gameRoot.soundSwitch == false)
{
   onoffClip.gotoAndStop(2);
   voiceOnClip.gotoAndStop(2);
   gameRoot.voices = false;
   voiceOnClip._alpha = 40;
}
else if(gameRoot.voices == false)
{
   voiceOnClip.gotoAndStop(2);
   gameRoot.voices = false;
}
