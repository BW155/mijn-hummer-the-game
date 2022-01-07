on(release){
   if(voiceOnClip._currentframe == 1)
   {
      voiceOnClip.gotoAndStop(2);
      gameRoot.voices = false;
   }
   else
   {
      voiceOnClip.gotoAndStop(1);
      gameRoot.voices = true;
   }
}
